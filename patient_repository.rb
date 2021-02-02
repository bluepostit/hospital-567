require 'csv'
require_relative 'patient'

class PatientRepository
  # State
  # - patients array
  # - next id
  # Behavior
  # - add patient
  # - load csv
  # - get all patients

  def initialize(csv_file_path, room_repository)
    @csv_file_path = csv_file_path
    @patients = []
    @room_repository = room_repository
    @next_id = 1
    load_csv
  end

  def all
    @patients
  end

  def find(id)
    # Find the Patient instance with `id` id
    @patients.find { |patient| patient.id == id }
  end

  def add_patient(patient)
    patient.id = @next_id
    @next_id += 1
    @patients << patient
    # store to csv
  end

  private

  def load_csv
    csv_options = {
      headers: :first_row,
      header_converters: :symbol
    }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      p row
      row[:id] = row[:id].to_i
      row[:cured] = row[:cured] == 'true'
      patient = Patient.new(row)
      # Find room by row[:room_id] in @room_repository
      room = @room_repository.find(row[:room_id].to_i)
      # Set the patient's room - with a Room instance!
      patient.room = room
      @patients << patient
    end
    @next_id = @patients.last.id + 1 if @patients.any?
  end
end

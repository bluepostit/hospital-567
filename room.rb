class Room
  # State
  # - name
  # - capacity
  # - patients
  # Behavior
  # - add_patient
  # - full?

  class CapacityReachedException < StandardError; end

  attr_reader :name, :patients, :capacity
  attr_accessor :id

  def initialize(attributes = {})
    @name = attributes[:name]
    @capacity = attributes[:capacity]
    @id = attributes[:id]
    @patients = []
  end

  def full?
    @patients.count >= @capacity
  end

  def add_patient(patient)
    if full?
      raise CapacityReachedException, 'The room is full'
    else
      @patients << patient
      patient.room = self
    end
  end
end

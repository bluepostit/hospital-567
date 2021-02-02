require_relative 'patient_repository'
require_relative 'room_repository'

room_repository = RoomRepository.new('rooms.csv')
patient_repo = PatientRepository.new('patients.csv', room_repository)

patient_repo.all.each do |patient|
  puts "Patient #{patient.name} is in the #{patient.room.name} room"
end

# nick = Patient.new(name: 'nick')
# patient_repo.add_patient(nick)

# puts "Added Nick!"
# p nick

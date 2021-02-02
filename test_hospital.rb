require_relative 'patient'
require_relative 'room'

sally = Patient.new(name: 'sally', id: 1)
bobby = Patient.new(name: 'bobby', blood_type: 'O')
molly = Patient.new(name: 'molly')

molly.id = 2

p sally
p bobby
p molly

puts "\n===================\n"

room = Room.new(name: '1A', capacity: 2)

room.add_patient(sally)
room.add_patient(bobby)

puts "Is the room full? #{room.full?}"
# p room

begin
  room.add_patient(molly)
  puts "Is the room full? #{room.full?}"
  # p room
rescue Room::CapacityReachedException
  puts "Sorry, couldn't add this patient to the room. It is full"
end

patients = room.patients
# p room
# p patients.first
# p patients.first.room

puts "Room #{room.name} has patient #{room.patients.first.name}"


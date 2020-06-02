# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database Clubs ...'
Club.destroy_all
puts 'Cleaning database Players ...'
Player.destroy_all
puts 'Cleaning database Users ...'
User.destroy_all
puts ''
puts 'Creating User ...'

User.create(email: "bob@gmail.com", password: "123456")

clubs = [{ name: 'VfR Aalen',
           user_id: User.first.id },
         { name: 'SC Charlottenburg',
           user_id: User.first.id },
         { name: 'FSV Salmrohr',
           user_id: User.first.id },
         { name: 'Wormatia Worms',
           user_id: User.first.id }]
clubs.each do |attributes|
  club = Club.create!(attributes)
  puts "Created #{club.name}"
end
puts 'Finished!'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: 'test@gmail.com', password: '123456')


puts 'Cleaning database Players.....'
Player.destroy_all
puts 'Cleaning database Statistics ...'
Statistic.destroy_all
puts 'Cleaning database Clubs ...'
Club.destroy_all
puts 'Cleaning database Players ...'
Player.destroy_all
puts 'Cleaning database Users ...'
User.destroy_all
puts ''
puts 'Creating User ...'


Player.create(
  name: 'Joshua Kimmich', birth: Date.new(1995,8,2), citizenship: 'Germany', hight: 176, position: 'Midfield', skill: ('Passing', 'Technique', 'Tactic', 'Teamplayer', 'Endurance'), address: "Margaretenstr. 37, 12203 Berlin")
Player.create(
  name: 'Thiago Alcántara do Nascimento', birth: Date.new(1991,11), citizenship: 'Spain', hight: 174, position: 'Midfield', skill: ('Passing', 'Technique', 'Tactic', 'Teamplayer', 'Endurance'), address: "Rudi-Dutschke-Straße 26, 12203 Berlin")
Player.create(
  name: 'Marc-André ter Stegen', birth: Date.new(1992,4,30), citizenship: 'Germany', hight: 187, position: 'Goalkeeper', skill: ('Passing', 'Technique', 'Tactic', 'Teamplayer', 'Strong'), address: "Friedrichstraße 140, 12203 Berlin")
Player.create(
  name: 'Emre Can', birth: Date.new(1994,1,12), citizenship: 'Germany', hight: 184, position: 'Defender', skill: ('Passing', 'Technique', 'Tactic', 'Teamplayer', 'Strong'), address: "Olympischer Platz 3, 14053 Berlin")


Player.create!(name: "George", user_id: User.first.id)

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

Tournament.create!(state: "Bayern", season_year: 2020)
Player.first.statistics.create!(
  [
      {game_qty: 400, goal_qty: 0, starting_eleven_avg: 5, tournament_id: Tournament.first.id },
      {game_qty: 20, goal_qty: 2, starting_eleven_avg: 30, tournament_id: Tournament.first.id },
      {game_qty: 10, goal_qty: 10 , starting_eleven_avg: 100, tournament_id: Tournament.first.id },
      {game_qty: 600, goal_qty: 50 , starting_eleven_avg: 80, tournament_id: Tournament.first.id }
  ]
)

puts 'Finished!'
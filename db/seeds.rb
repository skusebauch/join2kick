# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database Tournaments ...'
Tournament.destroy_all
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

user = User.create!(email: "bob@gmail.com", password: "123456")

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


Tournament.create!(
[
  {state: "Bayern", tournament_type: "Regionalliga Bayern", league: "Liga A" },
  {state: "Bavaria", tournament_type: "Landesliga", league: "Liga B" },
  {state: "Hasse", tournament_type: "Bundesliga" , league: "Liga C" },
  {state: "Saxony", tournament_type: "Regionalliga West" , league: "Liga D" }
]
  )

Player.last.statistics.create!(
  [
      {game_qty: 400, goal_qty: 0, starting_eleven_avg: 5, tournament_id: Tournament.last.id },
      {game_qty: 20, goal_qty: 2, starting_eleven_avg: 30, tournament_id: Tournament.last.id },
      {game_qty: 10, goal_qty: 10 , starting_eleven_avg: 100, tournament_id: Tournament.last.id },
      {game_qty: 600, goal_qty: 50 , starting_eleven_avg: 80, tournament_id: Tournament.last.id }
  ]
)

puts 'Finished!'

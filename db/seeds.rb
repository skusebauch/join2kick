# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning databases:'
puts '-> Statistics'
Statistic.destroy_all
puts '-> Tournaments'
Tournament.destroy_all
puts '-> Players'
Player.destroy_all
puts '-> Clubs'
Club.destroy_all
puts '-> Users'
User.destroy_all

## Users ##
puts ''
puts 'Creating Users ...'

users = [{ email: 'boris@gmail.com',
           password: '123456',
           address: "Rudi-Dutschke-Straße 26, 10969 Berlin"},
         { email: 'ThiagoN@gmail.com',
           password: '123456'},
         { email: 'MarcS@gmail.com',
           password: '123456'},
         { email: 'EmreC@gmail.com',
           password: '123456'}]

users.each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.email}"
end


## Clubs ##
puts ''
puts 'Creating Clubs ...'
clubs = [{ name: 'FC LeWagon 2013',
          budget: 20000,
           user_id: User.first.id },
         { name: 'SC Charlottenburg',
          budget: 25000,
           user_id: User.second.id },
         { name: 'FSV Salmrohr',
          budget: 15000,
           user_id: User.third.id },
         { name: 'Wormatia Worms',
          budget: 30000,
           user_id: User.fourth.id }]
clubs.each do |attributes|
  club = Club.create!(attributes)
  puts "Created #{club.name}"
end


## Players ##
puts ''
puts 'Creating Players ...'
players = [{ name: 'Joshua Kimmich',
           birth: Date.new(1995,8,2),
           citizenship: 'Germany',
           height: 176,
           position: 'Midfield',
           # skill: ['speed', 'passing'],
           skill: ["endurance", "passing"],
           address: "Margaretenstr. 37, 12203 Berlin",
           salary: 1000,
           user_id: User.first.id,
           club_id: Club.first.id },
         { name: 'Thiago Alcántara do Nascimento',
           birth: Date.new(1991,11),
           citizenship: 'Spain',
           height: 174,
           position: 'Midfield',
           skill: ["shooting", "speed"],
           address: "Rudi-Dutschke-Straße 26, 12203 Berlin",
           salary: 2000,
           user_id: User.second.id,
           club_id: Club.first.id },
         { name: 'Marc-André ter Stegen',
           birth: Date.new(1992,4,30),
           citizenship: 'Germany',
           height: 187,
           position: 'Goalkeeper',
           skill: ["strong", "tactic"],
           address: "Friedrichstraße 140, 12203 Berlin",
           salary: 1100,
           user_id: User.third.id,
           club_id: Club.first.id },
         { name: 'Emre Can',
           birth: Date.new(1994,1,12),
           citizenship: 'Germany',
           height: 184,
           position: 'Defender',
           skill: ["passing", "technique"],
           address: "Olympischer Platz 3, 14053 Berlin",
           salary: 1300,
           user_id: User.fourth.id,
           club_id: Club.first.id }]

players.each do |attributes|
  player = Player.create!(attributes)
  puts "Created #{player.name}"
end

## Tournaments ##
puts ''
puts 'Creating Tournaments ...'
Tournament.create!(
[
  {state: "Bayern", tournament_type: "Regionalliga Bayern", league: "Liga A" },
  {state: "Bavaria", tournament_type: "Landesliga", league: "Liga B" },
  {state: "Hasse", tournament_type: "Bundesliga" , league: "Liga C" },
  {state: "Saxony", tournament_type: "Regionalliga West" , league: "Liga D" }
]
  )

## Statistics ##
puts ''
puts 'Creating Statistics ...'
Player.last.statistics.create!(
  [
      {game_qty: 400, goal_qty: 0, starting_eleven_avg: 5, tournament_id: Tournament.last.id },
      {game_qty: 20, goal_qty: 2, starting_eleven_avg: 30, tournament_id: Tournament.last.id },
      {game_qty: 10, goal_qty: 10 , starting_eleven_avg: 100, tournament_id: Tournament.last.id },
      {game_qty: 600, goal_qty: 50 , starting_eleven_avg: 80, tournament_id: Tournament.last.id }
  ]
)

puts ''
puts 'Finished!'

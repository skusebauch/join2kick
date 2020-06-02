# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Statistic.destroy_all
Player.destroy_all
User.destroy_all
Tournament.destroy_all
user = User.create!(email: "bob@gmail.com", password: "123456")
Player.create!(name: "George", user_id: User.last.id)
Tournament.create!(state: "Bayern", season_year: 2020)
Player.last.statistics.create!(
  [
      {game_qty: 400, goal_qty: 0, starting_eleven_avg: 5, tournament_id: Tournament.last.id },
      {game_qty: 20, goal_qty: 2, starting_eleven_avg: 30, tournament_id: Tournament.last.id },
      {game_qty: 10, goal_qty: 10 , starting_eleven_avg: 100, tournament_id: Tournament.last.id },
      {game_qty: 600, goal_qty: 50 , starting_eleven_avg: 80, tournament_id: Tournament.last.id }
  ]
)

Tournament.create!(
[
  {state: "Bayern", tournament_type: "Regionalliga Bayern", league: "Liga A" },
  {state: "Bavaria", tournament_type: "Landesliga", league: "Liga B" },
  {state: "Hasse", tournament_type: "Bundesliga" , league: "Liga C" },
  {state: "Saxony", tournament_type: "Regionalliga West" , league: "Liga D" }
]
  )



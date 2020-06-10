require 'faker'

puts 'Cleaning databases:'
puts '-> Statistics'
Statistic.destroy_all
puts '-> ClubTournament'
ClubTournament.destroy_all
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
puts 'Creating User for Teams...'

# Admin User
User.create!(
  email: 'boris@gmail.com',
  password: '123456',
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  name: "Boris Paillard"
  )
# User for Viktoria Berlin
User.create!(
  email: 'hans@gmail.com',
  password: '123456',
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  name: "Hans Peter"
  )

# User for Berliner Sportclub
User.create!(
  email: 'kally@gmail.com',
  password: '123456',
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  name: "Kally Peter"
  )

puts ''
puts 'Creating Club FC LeWagon 2013, FSV Frankfurt and FC Wiesbaden ...'

# Our club
club_lewagon = Club.create!(
  name: "FC LeWagon 2013",
  budget: 20000,
  user: User.first
  # want to assign a league - have defined it above tournament
  )

club_fsv_frankfurt = Club.create!(
  name: "FSV Frankfurt",
  budget: 30000,
  user: User.second
  )

club_fc_wiesbaden = Club.create!(
  name: "FC Wiesbaden",
  budget: 50000,
  user: User.third
  )

## Tournaments ##
puts ''
puts 'Creating Tournaments and association ...'

hessenliga = Tournament.create!(state: "Hesse", season_year: "2019/2020", tournament_type: "championship", league: "Hessenliga")
verbandsliga = Tournament.create!(state: "Hesse", season_year: "2019/2020", tournament_type: "championship", league: "Verbandsliga")
dfb_pokal = Tournament.create!(state: "Germany", season_year: "2019/2020", tournament_type: "cup" , league: "DFB-Pokal")
hessenpokal = Tournament.create!(state: "Hesse", season_year: "2019/2020", tournament_type: "cup" , league: "Hessenpokal")
last_hessenliga = Tournament.create!(state: "Hesse", season_year: "2018/2019", tournament_type: "championship", league: "Hessenliga")
last_hessenpokal = Tournament.create!(state: "Hesse", season_year: "2018/2019", tournament_type: "cup", league: "Hessenpokal")
last_verbandsliga = Tournament.create!(state: "Hesse", season_year: "2018/2019", tournament_type: "championship", league: "Verbandsliga")



ClubTournament.create!(
  club: club_lewagon,
  tournament: hessenliga
  )

ClubTournament.create!(
  club: club_lewagon,
  tournament: last_hessenliga
  )

ClubTournament.create!(
  club: club_lewagon,
  tournament: dfb_pokal
  )

ClubTournament.create!(
  club: club_lewagon,
  tournament: hessenpokal
  )

ClubTournament.create!(
  club: club_lewagon,
  tournament: last_hessenpokal
  )

ClubTournament.create!(
  club: club_fsv_frankfurt,
  tournament: verbandsliga
  )

ClubTournament.create!(
  club: club_fsv_frankfurt,
  tournament: hessenpokal
  )

ClubTournament.create!(
  club: club_fc_wiesbaden,
  tournament: hessenliga
  )

ClubTournament.create!(
  club: club_fc_wiesbaden,
  tournament: hessenpokal
  )

# puts ''
# puts 'Creating 30 Free Agent Players ...'

# Create players with associtated user
# 30.times do
#   user = User.create(
#     email: Faker::Internet.email,
#     password: 123456,
#     address: Faker::Address.full_address
#     )
#   first = rand(Player::SKILLSET.count)
#   own_player = Player.create(
#     name: Faker::Name.name,
#     birth: Date.new(rand(1975..2003),rand(1..12), rand(1..26)),
#     citizenship: 'Germany',
#     height: 176,
#     position: (Player::POSITIONS).sample,
#     skill: (Player::SKILLSET).slice(first..first + rand(Player::SKILLSET.count)),
#     address: "Margaretenstr. 37, 12203 Berlin",
#     salary: rand(350..2000),
#     club: Club.first,
#     user: user
#     )

#   free_agency = Player.create(
#     name: Faker::Name.name,
#     birth: Date.new(rand(1975..2003),rand(1..12), rand(1..26)),
#     citizenship: 'Germany',
#     height: rand(160..195),
#     position: (Player::POSITIONS).sample,
#     skill: (Player::SKILLSET).slice(first..first + rand(Player::SKILLSET.count)),
#     address: "Margaretenstr. 37, 12203 Berlin",
#     salary: rand(350..2000),
#     user: user
#     )

#   statistics = Statistic.create!(
#     game_qty: rand(0..30),
#     goal_qty: rand(0..20),
#     starting_eleven_avg: rand(0..100),
#     tournament: Tournament.first,
#     player: free_agency
#   )
# end

puts ''
puts 'Creating FC LeWagon Players ...'

# goalkeeper own team

puts ''
puts 'Sarah ...'

user_sarah = User.create!(
  email: "sarah@test.de",
  password: 123456,
  address: Faker::Address.full_address
  )

player_sarah = Player.create!(
  name: 'Sarah Lafer',
  image: 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1556048247/ymehhwjerbyrghdubep5.jpg',
  birth: Date.new(rand(1975..2003),rand(1..12), rand(1..26)),
  citizenship: 'Austria 🇦🇹',
  height: rand(160..195),
  position: 'Goalkeeper',
  skill: 'Reflex',
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  salary: 750,
  club: club_lewagon,
  user: user_sarah
  )

Statistic.create!(
  game_qty: 24,
  goal_qty: 0,
  starting_eleven_avg: 90,
  tournament: hessenliga,
  player: player_sarah
  )

Statistic.create!(
  game_qty: 2,
  goal_qty: 0,
  starting_eleven_avg: 100,
  tournament: dfb_pokal,
  player: player_sarah
  )

Statistic.create!(
  game_qty: 4,
  goal_qty: 0,
  starting_eleven_avg: 100,
  tournament: hessenpokal,
  player: player_sarah
  )

Statistic.create!(
  game_qty: 34,
  goal_qty: 0,
  starting_eleven_avg: 100,
  tournament: last_hessenliga,
  player: player_sarah
  )

Statistic.create!(
  game_qty: 10,
  goal_qty: 0,
  starting_eleven_avg: 100,
  tournament: last_hessenpokal,
  player: player_sarah
  )

puts ''
puts 'Lino ...'

user_lino = User.create!(
  email: Faker::Internet.email,
  password: 123456,
  address: Faker::Address.full_address
  )

player_lino = Player.create!(
  name: 'Lino Maurer',
  image: 'https://avatars0.githubusercontent.com/u/59058786?v=4',
  birth: Date.new(rand(1975..2003),rand(1..12), rand(1..26)),
  citizenship: 'Germany 🇩🇪',
  height: rand(160..195),
  position: 'Goalkeeper',
  skill: 'Strong',
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  salary: 350,
  club: club_lewagon,
  user: user_lino
  )

Statistic.create!(
  game_qty: 2,
  goal_qty: 0,
  starting_eleven_avg: 100,
  tournament: hessenliga,
  player: player_lino
  )

Statistic.create!(
  game_qty: 20,
  goal_qty: 0,
  starting_eleven_avg: 100,
  tournament: last_hessenliga,
  player: player_lino
  )

Statistic.create!(
  game_qty: 10,
  goal_qty: 0,
  starting_eleven_avg: 100,
  tournament: last_hessenpokal,
  player: player_lino
  )

# defence

puts ''
puts 'Prateek ...'

user_prateek = User.create!(
  email: Faker::Internet.email,
  password: 123456,
  address: Faker::Address.full_address
  )

player_prateek = Player.create!(
  name: 'Prateek Mahindra',
  image: 'https://avatars1.githubusercontent.com/u/59365013?v=4',
  birth: Date.new(rand(1975..2003),rand(1..12), rand(1..26)),
  citizenship: 'India 🇮🇳',
  height: rand(160..195),
  position: 'Defender',
  skill: ['Strong', 'Passing'],
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  salary: 500,
  club: club_lewagon,
  user: user_prateek
  )

Statistic.create!(
  game_qty: 24,
  goal_qty: 2,
  starting_eleven_avg: 100,
  tournament: hessenliga,
  player: player_prateek
  )

Statistic.create!(
  game_qty: 34,
  goal_qty: 10,
  starting_eleven_avg: 100,
  tournament: last_verbandsliga,
  player: player_prateek
  )

Statistic.create!(
  game_qty: 4,
  goal_qty: 1,
  starting_eleven_avg: 100,
  tournament: hessenpokal,
  player: player_prateek
  )

Statistic.create!(
  game_qty: 10,
  goal_qty: 0,
  starting_eleven_avg: 100,
  tournament: last_hessenpokal,
  player: player_prateek
  )

puts ''
puts 'Amelie ...'

user_amelie = User.create!(
  email: Faker::Internet.email,
  password: 123456,
  address: Faker::Address.full_address
  )

player_amelie = Player.create!(
  name: 'Amélie Boudier',
  image: 'https://avatars2.githubusercontent.com/u/42960360?v=4',
  birth: Date.new(rand(1975..2003),rand(1..12), rand(1..26)),
  citizenship: 'France 🇫🇷',
  height: rand(160..195),
  position: 'Defender',
  skill: ['Technique', 'Endurance'],
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  salary: 550,
  club: club_lewagon,
  user: user_amelie
  )

Statistic.create!(
  game_qty: 24,
  goal_qty: 4,
  starting_eleven_avg: 80,
  tournament: hessenliga,
  player: player_amelie
  )

Statistic.create!(
  game_qty: 4,
  goal_qty: 2,
  starting_eleven_avg: 100,
  tournament: hessenpokal,
  player: player_amelie
  )


puts ''
puts 'Olivier ...'

user_olivier = User.create!(
  email: Faker::Internet.email,
  password: 123456,
  address: Faker::Address.full_address
  )

player_olivier = Player.create!(
  name: 'Olivier Girardot',
  image: 'https://avatars2.githubusercontent.com/u/32952612?v=4',
  birth: Date.new(rand(1975..2003),rand(1..12), rand(1..26)),
  citizenship: 'France 🇫🇷',
  height: rand(160..195),
  position: 'Defender',
  skill: ['Strong', 'Tactic'],
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  salary: 450,
  club: club_lewagon,
  user: user_olivier
  )

Statistic.create!(
  game_qty: 24,
  goal_qty: 2,
  starting_eleven_avg: 80,
  tournament: hessenliga,
  player: player_olivier
  )

Statistic.create!(
  game_qty: 34,
  goal_qty: 12,
  starting_eleven_avg: 90,
  tournament: last_verbandsliga,
  player: player_olivier
  )

Statistic.create!(
  game_qty: 4,
  goal_qty: 1,
  starting_eleven_avg: 100,
  tournament: hessenpokal,
  player: player_olivier
  )

Statistic.create!(
  game_qty: 8,
  goal_qty: 1,
  starting_eleven_avg: 100,
  tournament: last_hessenpokal,
  player: player_olivier
  )

puts ''
puts 'Isabelle ...'

user_isabelle = User.create!(
  email: Faker::Internet.email,
  password: 123456,
  address: Faker::Address.full_address
  )

player_isabelle = Player.create!(
  name: 'Isabelle Ferrier',
  image: 'https://avatars3.githubusercontent.com/u/49362529?v=4',
  birth: Date.new(rand(1975..2003),rand(1..12), rand(1..26)),
  citizenship: 'France 🇫🇷',
  height: rand(160..195),
  position: 'Defender',
  skill: ['Strong', 'Shooting', 'Tactic'],
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  salary: 500,
  club: club_lewagon,
  user: user_isabelle
  )

Statistic.create!(
  game_qty: 24,
  goal_qty: 8,
  starting_eleven_avg: 100,
  tournament: hessenliga,
  player: player_isabelle
  )

Statistic.create!(
  game_qty: 34,
  goal_qty: 6,
  starting_eleven_avg: 75,
  tournament: last_verbandsliga,
  player: player_isabelle
  )

Statistic.create!(
  game_qty: 4,
  goal_qty: 0,
  starting_eleven_avg: 80,
  tournament: hessenpokal,
  player: player_isabelle
  )

Statistic.create!(
  game_qty: 10,
  goal_qty: 0,
  starting_eleven_avg: 90,
  tournament: last_hessenpokal,
  player: player_isabelle
  )

puts ''
puts 'Nora ...'

user_nora = User.create!(
  email: Faker::Internet.email,
  password: 123456,
  address: Faker::Address.full_address
  )

player_nora = Player.create!(
  name: 'Nora Scheuch',
  image: 'https://avatars1.githubusercontent.com/u/29482385?v=4',
  birth: Date.new(rand(1975..2003),rand(1..12), rand(1..26)),
  citizenship: 'Germany 🇩🇪',
  height: rand(160..195),
  position: 'Defender',
  skill: ['Endurance'],
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  salary: 500,
  club: club_lewagon,
  user: user_nora
  )

Statistic.create!(
  game_qty: 24,
  goal_qty: 7,
  starting_eleven_avg: 80,
  tournament: hessenliga,
  player: player_nora
  )

Statistic.create!(
  game_qty: 34,
  goal_qty: 8,
  starting_eleven_avg: 90,
  tournament: last_verbandsliga,
  player: player_nora
  )

Statistic.create!(
  game_qty: 4,
  goal_qty: 1,
  starting_eleven_avg: 100,
  tournament: hessenpokal,
  player: player_nora
  )

Statistic.create!(
  game_qty: 7,
  goal_qty: 2,
  starting_eleven_avg: 80,
  tournament: last_hessenpokal,
  player: player_nora
  )

#Midfielder

puts ''
puts 'Arbi ...'

user_arbi = User.create!(
  email: Faker::Internet.email,
  password: 123456,
  address: Faker::Address.full_address
  )

player_arbi = Player.create!(
  name: 'Arbi Velaj',
  image: 'https://avatars2.githubusercontent.com/u/26385065?v=4',
  birth: Date.new(rand(1975..2003),rand(1..12), rand(1..26)),
  citizenship: 'Italy 🇮🇹',
  height: rand(160..195),
  position: 'Midfielder',
  skill: ['Shooting', 'Technique', 'Passing'],
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  salary: 1200,
  club: club_lewagon,
  user: user_arbi
  )

Statistic.create!(
  game_qty: 22,
  goal_qty: 15,
  starting_eleven_avg: 100,
  tournament: hessenliga,
  player: player_arbi
  )

Statistic.create!(
  game_qty: 34,
  goal_qty: 17,
  starting_eleven_avg: 100,
  tournament: last_hessenliga,
  player: player_arbi
  )

Statistic.create!(
  game_qty: 2,
  goal_qty: 2,
  starting_eleven_avg: 100,
  tournament: dfb_pokal,
  player: player_arbi
  )

Statistic.create!(
  game_qty: 4,
  goal_qty: 2,
  starting_eleven_avg: 100,
  tournament: hessenpokal,
  player: player_arbi
  )

Statistic.create!(
  game_qty: 7,
  goal_qty: 2,
  starting_eleven_avg: 80,
  tournament: last_hessenpokal,
  player: player_arbi
  )

puts ''
puts 'Alex ...'

user_alex = User.create!(
  email: Faker::Internet.email,
  password: 123456,
  address: Faker::Address.full_address
  )

player_alex = Player.create!(
  name: 'Alexander Dubovoy',
  image: 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1582630583/ky7b8bb3ogcx0lpdgkvd.jpg',
  birth: Date.new(rand(1975..2003),rand(1..12), rand(1..26)),
  citizenship: 'United States 🇺🇸',
  height: rand(160..195),
  position: 'Midfielder',
  skill: ['Speed', 'Technique', 'Endurance'],
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  salary: 1000,
  club: club_lewagon,
  user: user_alex
  )

Statistic.create!(
  game_qty: 24,
  goal_qty: 7,
  starting_eleven_avg: 93,
  tournament: hessenliga,
  player: player_alex
  )

Statistic.create!(
  game_qty: 34,
  goal_qty: 8,
  starting_eleven_avg: 88,
  tournament: last_hessenliga,
  player: player_alex
  )

Statistic.create!(
  game_qty: 2,
  goal_qty: 0,
  starting_eleven_avg: 100,
  tournament: dfb_pokal,
  player: player_alex
  )

Statistic.create!(
  game_qty: 4,
  goal_qty: 1,
  starting_eleven_avg: 100,
  tournament: hessenpokal,
  player: player_alex
  )

Statistic.create!(
  game_qty: 7,
  goal_qty: 2,
  starting_eleven_avg: 95,
  tournament: last_hessenpokal,
  player: player_alex
  )

puts ''
puts 'Claire ...'

user_claire = User.create!(
  email: Faker::Internet.email,
  password: 123456,
  address: Faker::Address.full_address
  )

player_claire = Player.create!(
  name: 'Claire Demont',
  image: 'https://avatars3.githubusercontent.com/u/45850166?v=4',
  birth: Date.new(rand(1975..2003),rand(1..12), rand(1..26)),
  citizenship: 'France 🇫🇷',
  height: rand(160..195),
  position: 'Midfielder',
  skill: ['Technique', 'Passing'],
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  salary: 950,
  club: club_lewagon,
  user: user_claire
  )

Statistic.create!(
  game_qty: 24,
  goal_qty: 10,
  starting_eleven_avg: 88,
  tournament: hessenliga,
  player: player_claire
  )

Statistic.create!(
  game_qty: 25,
  goal_qty: 12,
  starting_eleven_avg: 75,
  tournament: last_hessenliga,
  player: player_claire
  )

Statistic.create!(
  game_qty: 1,
  goal_qty: 1,
  starting_eleven_avg: 100,
  tournament: dfb_pokal,
  player: player_claire
  )

Statistic.create!(
  game_qty: 4,
  goal_qty: 2,
  starting_eleven_avg: 100,
  tournament: hessenpokal,
  player: player_claire
  )

Statistic.create!(
  game_qty: 5,
  goal_qty: 1,
  starting_eleven_avg: 95,
  tournament: last_hessenpokal,
  player: player_claire
  )

puts ''
puts 'Zuza ...'

user_zuza = User.create!(
  email: Faker::Internet.email,
  password: 123456,
  address: Faker::Address.full_address
  )

player_zuza = Player.create!(
  name: 'Zuza Żuber',
  image: 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1570609465/a8kmugjdqlihecdk9cz8.jpg',
  birth: Date.new(rand(1975..2003),rand(1..12), rand(1..26)),
  citizenship: 'Poland 🇵🇱',
  height: rand(160..195),
  position: 'Midfielder',
  skill: ['Technique', 'Passing', 'Speed'],
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  salary: 950,
  club: club_lewagon,
  user: user_zuza
  )

Statistic.create!(
  game_qty: 24,
  goal_qty: 14,
  starting_eleven_avg: 93,
  tournament: hessenliga,
  player: player_zuza
  )

Statistic.create!(
  game_qty: 30,
  goal_qty: 10,
  starting_eleven_avg: 75,
  tournament: last_hessenliga,
  player: player_zuza
  )

Statistic.create!(
  game_qty: 1,
  goal_qty: 0,
  starting_eleven_avg: 100,
  tournament: dfb_pokal,
  player: player_zuza
  )

Statistic.create!(
  game_qty: 4,
  goal_qty: 1,
  starting_eleven_avg: 80,
  tournament: hessenpokal,
  player: player_zuza
  )

Statistic.create!(
  game_qty: 10,
  goal_qty: 4,
  starting_eleven_avg: 100,
  tournament: last_hessenpokal,
  player: player_zuza
  )

puts ''
puts 'Anthony ...'

user_anthony = User.create!(
  email: Faker::Internet.email,
  password: 123456,
  address: Faker::Address.full_address
  )

player_anthony = Player.create!(
  name: 'Anthony Bandolon',
  image: 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1584532796/ohnfndhefemkjea708ag.jpg',
  birth: Date.new(rand(1975..2003),rand(1..12), rand(1..26)),
  citizenship: 'Germany 🇩🇪',
  height: rand(160..195),
  position: 'Midfielder',
  skill: ['Endurance', 'Passing'],
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  salary: 950,
  club: club_lewagon,
  user: user_anthony
  )

Statistic.create!(
  game_qty: 18,
  goal_qty: 8,
  starting_eleven_avg: 80,
  tournament: hessenliga,
  player: player_anthony
  )

Statistic.create!(
  game_qty: 20,
  goal_qty: 4,
  starting_eleven_avg: 78,
  tournament: last_hessenliga,
  player: player_anthony
  )

Statistic.create!(
  game_qty: 1,
  goal_qty: 0,
  starting_eleven_avg: 100,
  tournament: dfb_pokal,
  player: player_anthony
  )

Statistic.create!(
  game_qty: 4,
  goal_qty: 1,
  starting_eleven_avg: 60,
  tournament: hessenpokal,
  player: player_anthony
  )

Statistic.create!(
  game_qty: 5,
  goal_qty: 2,
  starting_eleven_avg: 80,
  tournament: last_hessenpokal,
  player: player_anthony
  )

puts ''
puts 'Bruno ...'

user_bruno = User.create!(
  email: Faker::Internet.email,
  password: 123456,
  address: Faker::Address.full_address
  )

player_bruno = Player.create!(
  name: 'Bruno Brunckhorst',
  image: 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1583184212/o1qfizldws5ocep0xt6c.jpg',
  birth: Date.new(rand(1975..2003),rand(1..12), rand(1..26)),
  citizenship: 'Germany 🇩🇪',
  height: rand(160..195),
  position: 'Midfielder',
  skill: ['Passing'],
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  salary: 750,
  club: club_lewagon,
  user: user_bruno
  )

Statistic.create!(
  game_qty: 17,
  goal_qty: 4,
  starting_eleven_avg: 75,
  tournament: hessenliga,
  player: player_bruno
  )

Statistic.create!(
  game_qty: 34,
  goal_qty: 12,
  starting_eleven_avg: 80,
  tournament: last_verbandsliga,
  player: player_bruno
  )

Statistic.create!(
  game_qty: 4,
  goal_qty: 2,
  starting_eleven_avg: 80,
  tournament: hessenpokal,
  player: player_bruno
  )

Statistic.create!(
  game_qty: 8,
  goal_qty: 1,
  starting_eleven_avg: 90,
  tournament: last_hessenpokal,
  player: player_bruno
  )

# Striker

puts ''
puts 'Andy ...'

user_andy = User.create!(
  email: Faker::Internet.email,
  password: 123456,
  address: Faker::Address.full_address
  )

player_andy = Player.create!(
  name: 'Andrey Baranov',
  image: 'https://avatars3.githubusercontent.com/u/12513436?v=4',
  birth: Date.new(rand(1975..2003),rand(1..12), rand(1..26)),
  citizenship: 'Russia 🇷🇺',
  height: rand(160..195),
  position: 'Striker',
  skill: ['Technique', 'Shooting', 'Speed'],
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  salary: 1150,
  club: club_lewagon,
  user: user_andy
  )

Statistic.create!(
  game_qty: 24,
  goal_qty: 20,
  starting_eleven_avg: 100,
  tournament: hessenliga,
  player: player_andy
  )

Statistic.create!(
  game_qty: 34,
  goal_qty: 27,
  starting_eleven_avg: 95,
  tournament: last_hessenliga,
  player: player_andy
  )

Statistic.create!(
  game_qty: 2,
  goal_qty: 3,
  starting_eleven_avg: 100,
  tournament: dfb_pokal,
  player: player_andy
  )

Statistic.create!(
  game_qty: 4,
  goal_qty: 3,
  starting_eleven_avg: 100,
  tournament: hessenpokal,
  player: player_andy
  )

Statistic.create!(
  game_qty: 10,
  goal_qty: 6,
  starting_eleven_avg: 100,
  tournament: last_hessenpokal,
  player: player_andy
  )

puts ''
puts 'Martin ...'

user_martin = User.create!(
  email: Faker::Internet.email,
  password: 123456,
  address: Faker::Address.full_address
  )

player_martin = Player.create!(
  name: 'Martin De Frutos',
  image: 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1541322516/ssjktftgsdicvy1cersj.jpg',
  birth: Date.new(rand(1975..2003),rand(1..12), rand(1..26)),
  citizenship: 'Spain 🇪🇸',
  height: rand(160..195),
  position: 'Striker',
  skill: ['Strong', 'Shooting', 'Speed'],
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  salary: 900,
  club: club_lewagon,
  user: user_martin
  )

Statistic.create!(
  game_qty: 15,
  goal_qty: 4,
  starting_eleven_avg: 90,
  tournament: hessenliga,
  player: player_martin
  )

Statistic.create!(
  game_qty: 24,
  goal_qty: 8,
  starting_eleven_avg: 94,
  tournament: last_verbandsliga,
  player: player_martin
  )

Statistic.create!(
  game_qty: 4,
  goal_qty: 1,
  starting_eleven_avg: 100,
  tournament: hessenpokal,
  player: player_martin
  )

Statistic.create!(
  game_qty: 8,
  goal_qty: 2,
  starting_eleven_avg: 80,
  tournament: last_hessenpokal,
  player: player_martin
  )

puts ''
puts 'Rich ...'

user_rich = User.create!(
  email: Faker::Internet.email,
  password: 123456,
  address: Faker::Address.full_address
  )

player_rich = Player.create!(
  name: "Rich O'Grady",
  image: 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1513088338/lmmcdeakg1co39u2lfzz.jpg',
  birth: Date.new(rand(1975..2003),rand(1..12), rand(1..26)),
  citizenship: 'England 🏴󠁧󠁢󠁥󠁮󠁧󠁿',
  height: rand(160..195),
  position: 'Striker',
  skill: ['Strong', 'Tactic', 'Shooting'],
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  salary: 1000,
  club: club_lewagon,
  user: user_rich
  )

Statistic.create!(
  game_qty: 24,
  goal_qty: 13,
  starting_eleven_avg: 90,
  tournament: hessenliga,
  player: player_rich
  )

Statistic.create!(
  game_qty: 25,
  goal_qty: 18,
  starting_eleven_avg: 95,
  tournament: last_hessenliga,
  player: player_rich
  )

Statistic.create!(
  game_qty: 2,
  goal_qty: 1,
  starting_eleven_avg: 100,
  tournament: dfb_pokal,
  player: player_rich
  )

Statistic.create!(
  game_qty: 4,
  goal_qty: 2,
  starting_eleven_avg: 100,
  tournament: hessenpokal,
  player: player_rich
  )

Statistic.create!(
  game_qty: 10,
  goal_qty: 4,
  starting_eleven_avg: 100,
  tournament: last_hessenpokal,
  player: player_rich
  )

puts ''
puts 'Finished!'

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
boris = User.create!(
  email: 'boris@gmail.com',
  password: '123456',
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  name: "Boris Paillard"
  )
# User for Viktoria Berlin
hans = User.create!(
  email: 'hans@gmail.com',
  password: '123456',
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  name: "Hans Peter"
  )

# User for Berliner Sportclub
kally = User.create!(
  email: 'kally@gmail.com',
  password: '123456',
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  name: "Kally Peter"
  )

hubert = User.create!(
  email: 'hubert@gmail.com',
  password: '123456',
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  name: "Hubert Müller"
  )

puts ''
puts 'Creating Club FC LeWagon 2013, FSV Frankfurt, FC Wiesbaden, KSV Kassel ...'

# Our club
club_lewagon = Club.create!(
  name: "Le Wagon FC",
  budget: 15000,
  user: boris
  # want to assign a league - have defined it above tournament
  )

club_fsv_frankfurt = Club.create!(
  name: "FSV Frankfurt",
  budget: 30000,
  user: hans
  )

club_fc_wiesbaden = Club.create!(
  name: "FC Wiesbaden",
  budget: 50000,
  user: kally
  )

club_ksv_kassel = Club.create!(
  name: "KSV Hessen Kassel",
  budget: 50000,
  user: hubert
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
  club: club_ksv_kassel,
  tournament: hessenliga
  )

ClubTournament.create!(
  club: club_ksv_kassel,
  tournament: dfb_pokal
  )

ClubTournament.create!(
  club: club_ksv_kassel,
  tournament: hessenpokal
  )

ClubTournament.create!(
  club: club_ksv_kassel,
  tournament: last_verbandsliga
  )

ClubTournament.create!(
  club: club_ksv_kassel,
  tournament: last_hessenliga
  )

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
  tournament: hessenliga
  )

ClubTournament.create!(
  club: club_fsv_frankfurt,
  tournament: hessenpokal
  )

ClubTournament.create!(
  club: club_fsv_frankfurt,
  tournament: dfb_pokal
  )

ClubTournament.create!(
  club: club_fc_wiesbaden,
  tournament: hessenliga
  )

ClubTournament.create!(
  club: club_fc_wiesbaden,
  tournament: hessenpokal
  )

ClubTournament.create!(
  club: club_fc_wiesbaden,
  tournament: dfb_pokal
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
  skill: 'Passing',
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
  skill: ['Passing'],
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
  skill: ['Endurance'],
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

# puts ''
# puts 'Isabelle ...'

# user_isabelle = User.create!(
#   email: Faker::Internet.email,
#   password: 123456,
#   address: Faker::Address.full_address
#   )

# player_isabelle = Player.create!(
#   name: 'Isabelle Ferrier',
#   image: 'https://avatars3.githubusercontent.com/u/49362529?v=4',
#   birth: Date.new(rand(1975..2003),rand(1..12), rand(1..26)),
#   citizenship: 'France 🇫🇷',
#   height: rand(160..195),
#   position: 'Defender',
#   skill: ['Strong', 'Shooting', 'Tactic'],
#   address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
#   salary: 500,
#   club: club_lewagon,
#   user: user_isabelle
#   )

# Statistic.create!(
#   game_qty: 24,
#   goal_qty: 8,
#   starting_eleven_avg: 100,
#   tournament: hessenliga,
#   player: player_isabelle
#   )

# Statistic.create!(
#   game_qty: 34,
#   goal_qty: 6,
#   starting_eleven_avg: 75,
#   tournament: last_verbandsliga,
#   player: player_isabelle
#   )

# Statistic.create!(
#   game_qty: 4,
#   goal_qty: 0,
#   starting_eleven_avg: 80,
#   tournament: hessenpokal,
#   player: player_isabelle
#   )

# Statistic.create!(
#   game_qty: 10,
#   goal_qty: 0,
#   starting_eleven_avg: 90,
#   tournament: last_hessenpokal,
#   player: player_isabelle
#   )

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
  skill: ['Shooting', 'Speed'],
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
  skill: ['Shooting'],
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

###############

puts ''
puts 'Creating Free Agent Player ...'

puts ''
puts 'nael ...'

user_nael = User.create!(
  email: Faker::Internet.email,
  password: 123456,
  address: Faker::Address.full_address
  )

player_nael = Player.create!(
  name: "Nael Najjar",
  image: 'https://res.cloudinary.com/dgwgea5k3/image/upload/v1591821323/8_egsyeh.jpg',
  birth: Date.new(rand(1991..2003),rand(1..12), rand(1..26)),
  citizenship: 'Germany 🇩🇪󠁧󠁢󠁥󠁮󠁧󠁿',
  height: rand(160..195),
  position: 'Striker',
  skill: ['Shooting'],
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  club: club_ksv_kassel,
  user: user_nael
  )

Statistic.create!(
  game_qty: 24,
  goal_qty: 13,
  starting_eleven_avg: 90,
  tournament: hessenliga,
  player: player_nael
  )

Statistic.create!(
  game_qty: 2,
  goal_qty: 1,
  starting_eleven_avg: 100,
  tournament: dfb_pokal,
  player: player_nael
  )

Statistic.create!(
  game_qty: 4,
  goal_qty: 2,
  starting_eleven_avg: 100,
  tournament: hessenpokal,
  player: player_nael
  )

puts ''
puts 'tim ...'

user_tim = User.create!(
  email: Faker::Internet.email,
  password: 123456,
  address: Faker::Address.full_address
  )

player_tim = Player.create!(
  name: "Tim Richter",
  image: 'https://res.cloudinary.com/dgwgea5k3/image/upload/v1591821362/7_mujqu4.jpg',
  birth: Date.new(rand(1991..2003),rand(1..12), rand(1..26)),
  citizenship: 'Germany 🇩🇪󠁧󠁢󠁥󠁮󠁧󠁿',
  height: rand(160..195),
  position: 'Midfielder',
  skill: ['Endurance', 'Technique'],
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  club: club_ksv_kassel,
  user: user_tim
  )

Statistic.create!(
  game_qty: 24,
  goal_qty: 10,
  starting_eleven_avg: 95,
  tournament: hessenliga,
  player: player_tim
  )

Statistic.create!(
  game_qty: 20,
  goal_qty: 14,
  starting_eleven_avg: 100,
  tournament: dfb_pokal,
  player: player_tim
  )

Statistic.create!(
  game_qty: 8,
  goal_qty: 5,
  starting_eleven_avg: 100,
  tournament: hessenpokal,
  player: player_tim
  )

puts ''
puts 'Alem ...'

user_alem = User.create!(
  email: Faker::Internet.email,
  password: 123456,
  address: Faker::Address.full_address
  )

player_alem = Player.create!(
  name: "Alem Koljic",
  image: 'https://res.cloudinary.com/dgwgea5k3/image/upload/v1591821333/6_kb9n0s.jpg',
  birth: Date.new(rand(1991..2003),rand(1..12), rand(1..26)),
  citizenship: 'Slovakia 󠁧󠁢󠁥🇸🇰',
  height: rand(160..195),
  position: 'Midfielder',
  skill: ['Endurance', 'Technique'],
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  club: club_ksv_kassel,
  user: user_alem
  )

Statistic.create!(
  game_qty: 24,
  goal_qty: 13,
  starting_eleven_avg: 95,
  tournament: hessenliga,
  player: player_alem
  )

Statistic.create!(
  game_qty: 60,
  goal_qty: 33,
  starting_eleven_avg: 90,
  tournament: last_hessenliga,
  player: player_alem
  )

Statistic.create!(
  game_qty: 8,
  goal_qty: 5,
  starting_eleven_avg: 100,
  tournament: dfb_pokal,
  player: player_alem
  )

Statistic.create!(
  game_qty: 20,
  goal_qty: 10,
  starting_eleven_avg: 100,
  tournament: hessenpokal,
  player: player_alem
  )

puts ''
puts 'Masse ...'

user_masse = User.create!(
  email: Faker::Internet.email,
  password: 123456,
  address: Faker::Address.full_address
  )

player_masse = Player.create!(
  name: "Massé Bell Bell",
  image: 'https://res.cloudinary.com/dgwgea5k3/image/upload/v1591821340/5_vtjujz.jpg',
  birth: Date.new(rand(1991..2003),rand(1..12), rand(1..26)),
  citizenship: 'Cameroon 🇨🇲',
  height: rand(160..195),
  position: 'Midfielder',
  skill: ['Endurance', 'Technique'],
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  club: club_ksv_kassel,
  user: user_masse
  )

Statistic.create!(
  game_qty: 24,
  goal_qty: 12,
  starting_eleven_avg: 75,
  tournament: hessenliga,
  player: player_masse
  )

Statistic.create!(
  game_qty: 34,
  goal_qty: 18,
  starting_eleven_avg: 85,
  tournament: last_hessenliga,
  player: player_masse
  )

Statistic.create!(
  game_qty: 9,
  goal_qty: 2,
  starting_eleven_avg: 95,
  tournament: dfb_pokal,
  player: player_masse
  )

Statistic.create!(
  game_qty: 40,
  goal_qty: 32,
  starting_eleven_avg: 97,
  tournament: hessenpokal,
  player: player_masse
  )

puts ''
puts 'Niklas ...'

user_niklas = User.create!(
  email: Faker::Internet.email,
  password: 123456,
  address: Faker::Address.full_address
  )

player_niklas = Player.create!(
  name: "Niklas Künzel",
  image: 'https://res.cloudinary.com/dgwgea5k3/image/upload/v1591821359/2_epggoc.jpg',
  birth: Date.new(rand(1991..2003),rand(1..12), rand(1..26)),
  citizenship: 'Germany 🇩🇪',
  height: rand(160..195),
  position: 'Midfielder',
  skill: ['Endurance', 'Technique'],
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  club: club_ksv_kassel,
  user: user_niklas
  )

Statistic.create!(
  game_qty: 24,
  goal_qty: 20,
  starting_eleven_avg: 75,
  tournament: hessenliga,
  player: player_niklas
  )

Statistic.create!(
  game_qty: 75,
  goal_qty: 34,
  starting_eleven_avg: 86,
  tournament: last_hessenliga,
  player: player_niklas
  )

Statistic.create!(
  game_qty: 12,
  goal_qty: 6,
  starting_eleven_avg: 90,
  tournament: dfb_pokal,
  player: player_niklas
  )

Statistic.create!(
  game_qty: 50,
  goal_qty: 23,
  starting_eleven_avg: 83,
  tournament: hessenpokal,
  player: player_niklas
  )

puts ''
puts 'pascal ...'

user_pascal = User.create!(
  email: Faker::Internet.email,
  password: 123456,
  address: Faker::Address.full_address
  )

player_pascal = Player.create!(
  name: "Pascal Bielert",
  image: 'https://res.cloudinary.com/dgwgea5k3/image/upload/v1591821349/4_bj2oko.jpg',
  birth: Date.new(rand(1991..2003),rand(1..12), rand(1..26)),
  citizenship: 'Germany 🇩🇪',
  height: rand(160..195),
  position: 'Goalkeeper',
  skill: ['Reflex'],
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  club: club_ksv_kassel,
  user: user_pascal
  )

Statistic.create!(
  game_qty: 15,
  goal_qty: 0,
  starting_eleven_avg: 100,
  tournament: hessenliga,
  player: player_pascal
  )

Statistic.create!(
  game_qty: 1,
  goal_qty: 0,
  starting_eleven_avg: 90,
  tournament: dfb_pokal,
  player: player_pascal
  )

Statistic.create!(
  game_qty: 10,
  goal_qty: 0,
  starting_eleven_avg: 100,
  tournament: hessenpokal,
  player: player_pascal
  )

Statistic.create!(
  game_qty: 75,
  goal_qty: 0,
  starting_eleven_avg: 85,
  tournament: last_verbandsliga,
  player: player_pascal
  )

puts ''
puts 'max ...'

user_max = User.create!(
  email: Faker::Internet.email,
  password: 123456,
  address: Faker::Address.full_address
  )

player_max = Player.create!(
  name: "Max Annemüller",
  image: 'https://res.cloudinary.com/dgwgea5k3/image/upload/v1591821355/3_w9jrlf.jpg',
  birth: Date.new(rand(1991..2003),rand(1..12), rand(1..26)),
  citizenship: 'Germany 🇩🇪',
  height: rand(160..195),
  position: 'Goalkeeper',
  skill: ['Reflex'],
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  club: club_ksv_kassel,
  user: user_max
  )

Statistic.create!(
  game_qty: 5,
  goal_qty: 0,
  starting_eleven_avg: 100,
  tournament: hessenliga,
  player: player_max
  )

Statistic.create!(
  game_qty: 5,
  goal_qty: 0,
  starting_eleven_avg: 100,
  tournament: hessenpokal,
  player: player_max
  )

Statistic.create!(
  game_qty: 12,
  goal_qty: 0,
  starting_eleven_avg: 73,
  tournament: last_verbandsliga,
  player: player_max
  )

puts ''
puts 'Julian ...'

user_julian = User.create!(
  email: Faker::Internet.email,
  password: 123456,
  address: Faker::Address.full_address
  )

player_julian = Player.create!(
  name: "Julian Bender",
  image: 'https://res.cloudinary.com/dgwgea5k3/image/upload/v1591821357/1_p037xc.jpg',
  birth: Date.new(rand(1991..2003),rand(1..12), rand(1..26)),
  citizenship: 'Germany 🇩🇪',
  height: rand(160..195),
  position: 'Defender',
  skill: ['Passing', 'Shooting'],
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  club: club_ksv_kassel,
  user: user_julian
  )

Statistic.create!(
  game_qty: 18,
  goal_qty: 4,
  starting_eleven_avg: 100,
  tournament: hessenliga,
  player: player_julian
  )

Statistic.create!(
  game_qty: 24,
  goal_qty: 6,
  starting_eleven_avg: 76,
  tournament: last_hessenliga,
  player: player_julian
  )


Statistic.create!(
  game_qty: 1,
  goal_qty: 0,
  starting_eleven_avg: 100,
  tournament: dfb_pokal,
  player: player_julian
  )

Statistic.create!(
  game_qty: 12,
  goal_qty: 3,
  starting_eleven_avg: 88,
  tournament: hessenpokal,
  player: player_julian
  )

puts ''
puts 'Mahir ...'

user_mahir = User.create!(
  email: "mahir@gmail.com",
  password: 123456,
  address: Faker::Address.full_address
  )

player_mahir = Player.create!(
  name: "Mahir Saglik",
  image: 'https://res.cloudinary.com/dgwgea5k3/image/upload/v1591821351/10_e1of8e.jpg',
  birth: Date.new(2001, 9, 20),
  citizenship: 'Turkey 🇹🇷',
  height: 195,
  position: 'Defender',
  skill: ['Strong', 'Tactic'],
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  club: club_ksv_kassel,
  user: user_mahir
  )

Statistic.create!(
  game_qty: 24,
  goal_qty: 3,
  starting_eleven_avg: 95,
  tournament: hessenliga,
  player: player_mahir
  )

Statistic.create!(
  game_qty: 28,
  goal_qty: 8,
  starting_eleven_avg: 87,
  tournament: last_hessenliga,
  player: player_mahir
  )

Statistic.create!(
  game_qty: 3,
  goal_qty: 0,
  starting_eleven_avg: 100,
  tournament: dfb_pokal,
  player: player_mahir
  )

Statistic.create!(
  game_qty: 12,
  goal_qty: 1,
  starting_eleven_avg: 93,
  tournament: hessenpokal,
  player: player_mahir
  )

Statistic.create!(
  game_qty: 30,
  goal_qty: 4,
  starting_eleven_avg: 100,
  tournament: last_verbandsliga,
  player: player_mahir
  )

puts ''
puts 'Stefano ...'

user_stefano = User.create!(
  email: Faker::Internet.email,
  password: 123456,
  address: Faker::Address.full_address
  )

player_stefano = Player.create!(
  name: "Stefano Maier",
  image: 'https://res.cloudinary.com/dgwgea5k3/image/upload/v1591821340/9_utbb5i.jpg',
  birth: Date.new(1998, 10, 12),
  citizenship: 'Germany 🇩🇪',
  height: 191,
  position: 'Defender',
  skill: ['Strong', 'Tactic'],
  address: "Rudi-Dutschke-Straße 26, 10969 Berlin",
  club: club_ksv_kassel,
  user: user_stefano
  )

Statistic.create!(
  game_qty: 22,
  goal_qty: 4,
  starting_eleven_avg: 85,
  tournament: hessenliga,
  player: player_stefano
  )

Statistic.create!(
  game_qty: 26,
  goal_qty: 3,
  starting_eleven_avg: 75,
  tournament: last_hessenliga,
  player: player_stefano
  )

Statistic.create!(
  game_qty: 7,
  goal_qty: 2,
  starting_eleven_avg: 93,
  tournament: hessenpokal,
  player: player_stefano
  )

Statistic.create!(
  game_qty: 24,
  goal_qty: 1,
  starting_eleven_avg: 88,
  tournament: last_verbandsliga,
  player: player_stefano
  )

puts ''
puts 'Finished!'

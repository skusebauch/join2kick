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
puts 'Creating BigBoss User ...'

# Admin User
User.create(
  email: 'boris@gmail.com',
  password: '123456'
  )

puts ''


puts 'Creating Users ...'

# Our club
club = Club.create(
  name: "FC LeWagon 2013",
  budget: 20000,
  user: User.first
  # want to assign a league - have defined it above tournament
  )

## Tournaments ##
puts ''
puts 'Creating Tournaments ...'
Tournament.create!(
[
  {state: "Hesse", season_year: "2019/2020", tournament_type: "championship", league: "Hessenliga" },
  {state: "Hesse", season_year: "2019/2020", tournament_type: "championship", league: "Verbandsliga" },
  {state: "Hesse", season_year: "2019/2020", tournament_type: "cup" , league: "DFB-Pokal" },
  {state: "Hesse", season_year: "2019/2020", tournament_type: "cup" , league: "Hessenpokal" }
]
  )

ClubTournament.create!(
  club: club,
  tournament: Tournament.all.sample
  )


# For the players
30.times do
  user = User.create(
    email: Faker::Internet.email,
    password: 123456,
    address: Faker::Address.full_address
    )
  first = rand(Player::SKILLSET.count)
  own_player = Player.create(
    name: Faker::Name.name,
    birth: Date.new(1992,1,12),
    citizenship: 'Germany',
    height: 176,
    position: (Player::POSITIONS).sample,
    skill: (Player::SKILLSET).slice(first..first + rand(Player::SKILLSET.count)),
    address: "Margaretenstr. 37, 12203 Berlin",
    salary: rand(350..2000),
    club: Club.first,
    user: user
    )

  free_agency = Player.create(
    name: Faker::Name.name,
    birth: Date.new(1992,1,12),
    citizenship: 'Germany',
    height: rand(160..195),
    position: (Player::POSITIONS).sample,
    skill: (Player::SKILLSET).slice(first..first + rand(Player::SKILLSET.count)),
    address: "Margaretenstr. 37, 12203 Berlin",
    salary: rand(350..2000),
    user_id: user
    )

  statistics = Statistic.create!(
    game_qty: rand(0..400),
    goal_qty: rand(0..90),
    starting_eleven_avg: rand(0..100),
    tournament: Tournament.first,
    player: Player.first
  )
end

puts ''
puts 'Creating FC LeWagon 2013 ...'



## Statistics ##
puts ''
puts 'Creating Statistics ...'


puts ''
puts 'Finished!'

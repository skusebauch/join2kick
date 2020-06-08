class Tournament < ApplicationRecord
  has_many :club_tournaments
  has_many :clubs, through: :club_tournaments
  has_many :statistics
  has_many :players, through: :statistics

  YEAR = ['2019/2020', '2018/2019']
  LEAGUE = ['Hessenliga', 'Verbandsliga']
end

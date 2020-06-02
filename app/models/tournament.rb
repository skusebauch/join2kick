class Tournament < ApplicationRecord
  has_many :club_tournaments
  has_many :clubs, through: :club_tournaments
  has_many :statistics
  has_many :players, through: :statistics
end

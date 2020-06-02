class Club < ApplicationRecord
  belongs_to :user
  has_many :players
  has_many :club_tournaments
  has_many :tournaments, through: :club_tournaments
end

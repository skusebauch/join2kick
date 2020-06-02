class Player < ApplicationRecord
  belongs_to :user
  belongs_to :club, optional: true
  has_many :statistics
  has_many :tournaments, through: :statistics
  # geocode
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  # skills
  SKILL = ["speed", "strong", "endurance", "passing", "shooting", "technique", "teamplayer", "tactic"]
  validates :skill, inclusion: { in: SKILL }
end

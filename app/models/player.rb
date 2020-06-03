class Player < ApplicationRecord
  belongs_to :user
  belongs_to :club, optional: true
  has_many :statistics
  has_many :tournaments, through: :statistics
  # geocode
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  # skills
  validate :valid_skillset

  def valid_skillset
    skillset = ["endurance",
                "passing",
                "shooting", "speed", "strong",
                "tactic", "teamplayer", "technique"]
    errors.add(:skill, "Not valid skill") unless (skill - skillset).empty?
    # skills.bsearch { |i| skill <=> i }
  end
end

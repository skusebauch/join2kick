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
  include PgSearch::Model
  pg_search_scope :search,
    against: [:name, :salary, :position, :skill, :birth, :address],

    using: {
      tsearch: { prefix: true }
    }

  SKILLSET = ["endurance",
                "passing",
                "shooting", "speed", "strong",
                "tactic", "teamplayer", "technique"]

  POSITIONS = ["Goalkeeper", "Defence", "Midfield", "Striker"]

  def valid_skillset
    errors.add(:skill, "Not valid skill") unless (skill - SKILLSET).empty?
    # skills.bsearch { |i| skill <=> i }
  end

  def avg_starting
    return 0 if statistics.empty?

    avg = 0
    statistics.each do |stat|
      avg += stat.starting_eleven_avg
    end
    avg / statistics.count
  end

  def age(dob)
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
end

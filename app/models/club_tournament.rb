class ClubTournament < ApplicationRecord
  belongs_to :club
  belongs_to :tournament
end

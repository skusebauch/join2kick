class Conversation < ApplicationRecord
  belongs_to :user, foreign_key: :sender_id
  belongs_to :user, foreign_key: :receiver_id
  validates_uniqueness_of :sender_id, scope: :receiver_id
end

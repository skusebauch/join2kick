class Conversation < ApplicationRecord
  # belongs_to :user, foreign_key: :sender_id
  # belongs_to :user, foreign_key: :receiver_id
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  validates_uniqueness_of :sender_id, scope: :receiver_id
  has_many :messages
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo
  has_one :player
  has_many :clubs
  has_many :messages, through: :conversations, dependent: :destroy
  has_many :conversations, through: :messages
end

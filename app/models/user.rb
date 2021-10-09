class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :confirmed_friendships, -> { where confirmed: true }, class_name: 'Friendship'
  has_many :friends, through: :confirmed_friendships

  # Users who needs to confirm friendship
  has_many :pending_friendships, -> { where confirmed: false }, class_name: 'Friendship', foreign_key: 'user_id'
  has_many :pending_friends, through: :pending_friendships, source: :friend

  # Users who requested to be friends (needed for notifications)
  has_many :inverted_friendships, -> { where confirmed: false }, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :friend_requests, through: :inverted_friendships, source: :friend

  has_many :friendships, dependent: :destroy
  has_many :messages, ->{where('sender_id > ? or receiver_id > ?', 0, 0)}
  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'
  has_many :recieved_messages, class_name: 'Message', foreign_key: 'receiver_id'
end

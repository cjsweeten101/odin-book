class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
 				 :rememberable, :omniauthable, :validatable
 	validates :firstname, presence: true
 	validates :lastname, presence: true

 	has_many :sent_requests, class_name: :FriendRequest, foreign_key: :user_id
 	has_many :received_requests, class_name: :FriendRequest, foreign_key: :friend_id

 	has_many :pending_friends, through: :sent_requests, source: :friend
 	has_many :pending_requests, through: :received_requests, source: :user
end

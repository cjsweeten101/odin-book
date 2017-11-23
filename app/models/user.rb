class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
 				 :rememberable, :omniauthable, :validatable
 	validates :firstname, presence: true
 	validates :lastname, presence: true
end

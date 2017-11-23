class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
 				 :rememberable, :omniauthable, :validatable
end

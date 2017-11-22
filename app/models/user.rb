class User < ApplicationRecord
  devise :database_authenticatable,
 				 :rememberable, :omniauthable
end

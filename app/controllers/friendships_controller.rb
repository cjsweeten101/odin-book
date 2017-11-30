class FriendshipsController < ApplicationController

	def new
		friend = User.find(params[:id])
		if create_mutual_friendship(current_user, friend)
			flash[:success] = "Friend Added!"
			FriendRequest.find_by(user_id:friend.id).delete
		else
			flash[:error] = "Could not add friend"
		end
		redirect_to current_user
	end

	def destroy
		friend = User.find(params[:id])
		if delete_mutual_friendship(current_user, friend)
			flash[:success] = "Friend deleted"
		else
			flash[:error] = "Could not delete friend"
		end
		redirect_to current_user
	end

	private
		def create_mutual_friendship(user, friend)
			f1 = Friendship.new(user:user, friend:friend)
			f2 = Friendship.new(user:friend, friend:user)
			f1.save && f2.save ? (return true) : (return false)
		end

		def delete_mutual_friendship(user, friend)
			f1_id = Friendship.find_by_user_id_and_friend_id(user.id, friend.id).id
			f2_id = Friendship.find_by_user_id_and_friend_id(friend.id, user.id).id
			Friendship.destroy([f1_id,f2_id]) ? (return true) : (return false)
		end
end

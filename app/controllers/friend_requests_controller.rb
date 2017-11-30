class FriendRequestsController < ApplicationController
	def index
	end

	def destroy
		user_id = params[:id]
		FriendRequest.find_by(user_id:user_id).destroy
		render 'index'
	end

	def new
		friend = User.find(params[:id])
		request = FriendRequest.new(user: current_user, friend:friend)
		if request.save
			flash['success'] = "Friend request sent!"
		else
			flash['failure'] = "Something went wrong :/"
		end
		redirect_to users_path
	end
end

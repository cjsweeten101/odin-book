class FriendRequest < ApplicationRecord
	belongs_to :user
	belongs_to :friend, class_name: "User"

	validate :can_not_friend_self
	validate :can_not_friend_friends

	private

	def can_not_friend_self
		@errors.add(:base, "Can't send friend request to yourself. . .") if self.user == self.friend
	end

	def can_not_friend_friends
		@errors.add(:base, "Already friends. . .") if self.user.friends.include? self.friend
	end
end

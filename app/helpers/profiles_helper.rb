module ProfilesHelper
	def profile_avatar_select user
		if user.avatar.exists?
			user.avatar.url(:medium)
		else
			'placeholder.png'
		end
	end
	def current_user_is_following(current_user_id, followed_user_id)
	    relationship = Follow.find_by(follower_id: current_user_id, following_id: followed_user_id)
	    return true if relationship
  end
end

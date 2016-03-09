module ProfilesHelper
	def profile_avatar_select user
		if user.avatar.exists?
			post.avatar.url(:medium)
		else
			'placeholder.jpg'
		end
	end
end

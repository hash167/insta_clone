module ProfilesHelper
	def profile_avatar_select user
		if user.avatar.exists?
			user.avatar.url(:medium)
		else
			'placeholder.png'
		end
	end
end

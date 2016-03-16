module PostsHelper
	

	def check_if_image_is_uploaded post
		if post.image_file_name != nil
			post.image.url(:medium)
		else
			'placeholder.jpg'
		end
	end
	def liked_post post
		return link_to '', unlike_post_path(post.id), remote: true, id: "like_#{post.id}", class: "glyphicon glyphicon-heart like" if current_user.voted_for? post
    	link_to '', like_post_path(post.id), remote: true, id: "like_#{post.id}", class: "glyphicon glyphicon-heart-empty"
	end
	def display_likes(post)
	    votes = post.votes_for.up.by_type(User)
	    return list_likers(votes) if votes.size <= 8
	    count_likers(votes)
  	end
	private
	
  	def list_likers votes
		user_names = []
	    unless votes.blank?
	      votes.voters.each do |voter|
	        user_names.push(link_to voter.user_name,
	                                profile_path(voter.user_name),
	                                class: 'user-name')
	      end
	      user_names.to_sentence.html_safe + like_plural(votes)
    end
	end
	def like_plural(votes)
    	return ' like this' if votes.count > 1
    	' likes this'
  	end
  	def count_likers(votes)
	    vote_count = votes.size
	    vote_count.to_s + ' likes'
  	end
end

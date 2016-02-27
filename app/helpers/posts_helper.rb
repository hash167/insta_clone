module PostsHelper
	def check_if_image_is_uploaded post
		if post.image_file_name != nil
			post.image.url(:medium)
		else
			'placeholder.jpg'
		end
	end
end

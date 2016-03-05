# On the posts index view and the posts show view, 
# a form will exist under each post for us to add a comment if we so desire.
# By writing something in that form and submitting,
# we save the comment to that post and it identifies who made the comment.
# We’re redirected back to wherever we were after submitting the form.

class CommentsController < ApplicationController
	before_action :set_post
	
	def index
		@comments = @posts.comments.order("created_at ASC")
		format.html { render layout: !request.xhr? }
	end
	def create
		@comment = @post.comments.build(comment_params)
		@comment.user_id = current_user.id

		if @comment.save
			respond_to do |format|
				format.html {redirect_to :back}
				format.js
			end
				
		else
			flash[:alert] = "Check the comment form, something went wrong"
			render root_path
		end

	end

	def destroy
		@comment = @post.comments.find(params[:id])
	    @comment.delete
	    respond_to do |format|
	        format.html { redirect_to root_path }
	        format.js
	    end
	end

	private

	def comment_params
		params.require(:comment).permit(:content)
	end
	def set_post
		@post = Post.find(params[:post_id])
	end
end

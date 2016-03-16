class PostsController < ApplicationController
	before_filter :set_post, only: [:show, :edit, :update, :destroy, :like, :unlike]
	before_action :authenticate_user!
	before_action :owned_post, only: [:edit, :update, :destroy]
	def index
		@posts = Post.all.order('created_at DESC').page params[:page]  
	end 

	def new
		@post = current_user.posts.build
	end

	def show  
  		
	end 
	def edit
		
	end 
	def like  
	  if @post.liked_by current_user
	      respond_to do |format|
	        format.html do 
	        	redirect_to :back 
	        end
	        format.js
	      end
	   end
	end
	def unlike
		if @post.unliked_by current_user
	      respond_to do |format|
	        format.html do 
	        	redirect_to :back 
	        end
	        format.js
	      end
	   end
	end  
	def update
		
		if @post.update(post_params)
			flash[:success] = "Post updated"
			redirect_to post_path(@post)
		else
			flash[:alert] = "Check parameters"
			render :edit
		end
	end

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			flash[:success] = "You're post has been created"
			redirect_to @post
		else
			flash[:alert] = "You need an image to post here!"
			render :new
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path
	end

	private

	def post_params
		params.require(:post).permit(:caption, :image)
	end 
	def set_post
		puts params[:id]
		@post = Post.find(params[:id])
	end
	def owned_post
		unless current_user == @post.user
			flash[:alert] = "That post doesn't belong to you!"
			redirect_to root_path
		end

	end

end

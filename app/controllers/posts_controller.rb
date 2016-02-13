class PostsController < ApplicationController
	before_filter :set_post, only: [:show, :edit, :update, :destroy]
	def index
		@posts = Post.all  
	end 

	def new
		@post = Post.new
	end

	def show  
  		
	end 
	def edit
		
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
		@post = Post.new(post_params)
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
		@post = Post.find(params[:id])
	end

end

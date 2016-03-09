class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]
  def show
  	@posts = @user.posts.order('created_at DESC')
  end
  def edit
  end
  def update
  	if @user.update(profile_params)
  		flash[:success] = 'Your profile has been updated'
  		redirect_to profile_path(@user.user_name)
  	else
  		@user.errors.full_messages
  		flash[:error] = @user.errors.full_messages
  		render :edit
  	end
  end
  private

  def profile_params
  	params.require(:profile).permit(:avatar,:bio)
  end
  def set_profile
  	@user = User.find_by(user_name: params[:user_name])
  end
end

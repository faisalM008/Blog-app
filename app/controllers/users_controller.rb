class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      flash.now[:notice] = @user.errors.full_messages
      render :new
    end

  end
  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :terms_of_service)
  end
end

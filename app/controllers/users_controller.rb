class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the Alpha blog #{@user.user_name}, you have successfully signup"
      redirect_to articles_path
    else
      render 'new'
    end

  end

  private
  def user_params
    params.require(:user).permit(:user_name, :email, :password)
  end


end


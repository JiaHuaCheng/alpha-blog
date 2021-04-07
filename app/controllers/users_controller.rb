class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Your account information was sucessfully updated"
      redirect_to articles_path
    else
      render 'edit'
    end

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


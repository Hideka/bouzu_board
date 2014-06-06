class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
 
  def new
    @user = User.new
  end

  def create
    user = User.new
    user.name = params[:name]
    user.user_id = params[:user_id]
    user.password = params[:password]
    user.email = params[:email]
    user.save
    redirect_to user_path(user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :email)
  end

end

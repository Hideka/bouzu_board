class Users::RegistrationsController < Devise::RegistrationsController
  def create
    @user = User.new(user_params)
    if @user.save
      sign_up('user', @user)
      redirect_to boards_path
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end


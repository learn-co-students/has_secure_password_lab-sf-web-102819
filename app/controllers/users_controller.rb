class UsersController < ApplicationController
  # Sign Up FORM?
  def new
    
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # logs you in when the user_id is assigned in the session
      session[:user_id] = @user.id
      # redirect_to controller: 'welcome', action: 'home'
      # redirect_to @user
    else
      redirect_to(controller: "users", action: "new")
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end

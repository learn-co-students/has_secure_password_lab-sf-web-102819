class SessionsController < ApplicationController
  # Login Form?
  def new
    
  end

  def create
    # find the user with that username
    user = User.find_by(name: params[:user][:name])
    # authenticate the password
    authenticated = user.try(:authenticate, params[:user][:password])
    # return a forbidden message if authenticated is false
    return head(:forbidden) unless authenticated
    # if authenticated is true assign user to instance variable user
    @user = user
    # assign session user_id to value @user.id
    session[:user_id] = @user.id
  end
end
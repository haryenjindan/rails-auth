class UserSessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(username: user_params[:username])
    if user and user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "User #{user.username} has logged in."
    else
      flash[:alert] = "Invalid user and/or password combination."
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "User has logged out."
  end
  
  private
  
    def user_params
      params.permit(:username, :password)
    end
    
end

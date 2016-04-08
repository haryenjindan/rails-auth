class UsersController < ApplicationController
  
  def home
    if not logged_in?
      @user = User.new
    else
      @user = current_user
    end    
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "User #{@user.username} was created."
    else
      render 'new'
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:username, :password)
    end
    
    def current_user
      current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    def logged_in?
      not current_user.nil?
    end
    
end

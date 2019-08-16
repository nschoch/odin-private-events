class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    
    if user
      message = "Logged in"
      flash[:success] = message
      log_in user
      redirect_to user
    else
      message = "User not found"
      flash[:danger] = message
      redirect_to root_url
    end
  end

  def destroy
  end
end

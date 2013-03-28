class UserSessionsController < ApplicationController
  def new
  end
  
  def create
    if login(params[:username], params[:password])
      redirect_back_or_to(cart_path, message: 'Logged in successfully.')
    else
      flash.alert = "Login failed."
      redirect_to login_path
    end
  end

  def destroy
    logout
    redirect_to(:users, message: 'Logged out!')
  end
end

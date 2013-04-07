class UserSessionsController < ApplicationController
  def new
  end
  
  def create
    if login(params[:username], params[:password])
      redirect_back_or_to(orders_path, message: 'Logged in successfully.')
    else
      flash[:red] = "Login failed."
      redirect_to login_path
    end
  end

  def destroy
    logout
    flash[:green] = 'Logged out!'
    redirect_to root_path
  end
end

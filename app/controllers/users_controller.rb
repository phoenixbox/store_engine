class UsersController < ApplicationController

  def index
    require_admin
    @users = User.all
  end

  def show
    if current_user.id == params[:id] || current_user.admin == true
      @user = User.find(params[:id])
    else
      flash[:red] = "you don't belong here"
      redirect_to root_path
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    if current_user.id == params[:id]
      @user = User.find(params[:id])
    else
      flash[:red] = "you don't belong here"
      redirect_to root_path
    end
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      UserMailer.signup_confirmation(@user).deliver
      auto_login(@user)
      flash[:green] = 'User was successfully created.' 
      redirect_to root_path
    else
      render action: "new"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:yellow] = 'User was successfully updated.' 
      redirect_to @user
    else
      render action: "edit"
    end
  end

  def destroy
    :require_admin
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

end

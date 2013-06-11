class UsersController < ApplicationController
  
  before_filter :authenticate_user!, only: [:show, :edit, :update]
  before_filter :authenticate_admin!, :only [:destroy, :index]

	def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save!
      flash[:success] = "Welcome to crushthewod!"
      sign_in @user
      redirect_to @user
    else
    	render 'new'
    end
  end
 
  def index
    @users = User.all
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes!(params[:user])
      flash[:success] = "Profile edited successfully!"
      redirect_to @user
    else
    	render 'edit'
    end 
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

end

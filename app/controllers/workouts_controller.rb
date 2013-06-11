class WorkoutsController < ApplicationController

	before_filter :authenticate_correct_or_admin!

	def show
    @workout = Workout.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @workout = @user.workouts.new
  end

  def create
    @workout = Workout.new(params[:workout])
    if @workout.save!
      flash[:success] = "Workout logged!"
      sign_in @workout
      redirect_to @workout
    else
    	render 'new'
    end
  end
 
  def index
    @workouts = Workout.all
  end

  def edit
  	@workout = Workout.find(params[:id])
  end

  def update
  	@workout = Workout.find(params[:id])
  	if @workout.update_attributes!(params[:workout])
      flash[:success] = "Workout edited successfully!"
      redirect_to @workout
    else
    	render 'edit'
    end 
  end

  def destroy
    Workout.find(params[:id]).destroy
    flash[:success] = "Workout deleted."
    redirect_to workouts_url
  end

  private

	  def authenticate_correct_or_admin!
	  	if user_signed_in?
	  		unless current_user == User.find(params[:user_id]) || admin?
	  			return false
	  		end
	  		return true
	  	else
	  		return false
	  	end
	  end

end
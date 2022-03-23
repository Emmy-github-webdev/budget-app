class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[show edit update destroy]

  def index
    @activities = Acticity.all.where(user_id: current_user.id)
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params, user_id: current_user.id)
    
    if @activity.save
      flash[:notice] = 'Activity created successfully' 
    else
      flash[:notice] = 'Try again, Something went wrong' 
    end
    redirect_to categories_path
  end
  
  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:name, :amount, categories: [])
  end
end

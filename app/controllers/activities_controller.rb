class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[show edit update destroy]

  def index
    @activities = Activity.all.where(user_id: current_user.id)
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user_id = current_user

    if @activity.save
      flash[:ncategories.otice] = 'Activity created successfully' 
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
    params.require(:activity).permit(:name, :amount, category_ids: [])
  end
end

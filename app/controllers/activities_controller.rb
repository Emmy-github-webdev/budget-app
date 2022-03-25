class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_activity, only: %i[show]

  def index
    @activities = Activity.all.where(user_id: current_user.id)
  end

  def new
    @add_activity = Activity.new
  end

  def create
    @add_activity = Activity.new(activity_params)
    add_activity.author = current_user

    if @activity.save
    flash[:notice] = 'Transaction created successfully'
    else
      flash[:alert] = 'Try again, Something went wrong'
    end
    redirect_to categories_path
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:name, :amount, category_id: [])
  end
end

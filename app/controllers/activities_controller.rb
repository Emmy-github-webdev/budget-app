class ActivitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @activities = Activity.all.where(user_id: current_user.id)
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.author = current_user

    if @activity.save
      flash[:notice] = 'Transaction created successfully'
    else
      flash[:alert] = 'Try again, Something went wrong'
    end
    redirect_to categories_path
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :amount, category_ids: [])
  end
end

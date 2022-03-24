class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_activity, only: %i[show]

  def index
    @activities = Activity.all.where(user_id: current_user.id)
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(
      user_id: current_user.id,
      name: activity_params[:name],
      amount: activity_params[:amount],
      category_ids: activity_params[:category_ids]
    )

    flash[:notice] = if @activity.save
      'Category created successfully'
    else
      'Try again, Something went wrong'
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

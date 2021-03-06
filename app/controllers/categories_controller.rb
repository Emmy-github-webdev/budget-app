class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = current_user.categories
  end

  def show
    @activities = @category.activities.order(created_at: 'desc')
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(user_id: current_user.id, name: category_params[:name], icon: category_params[:icon])
    flash[:notice] = if @category.save
                       'Category created successfully'
                     else
                       'Try again, Something went wrong'
                     end
    redirect_to categories_path
  end

  def destroy
    @category.delete
    respond_to do |format|
      format.html { redirect_to category_path, notice: 'Category deleted successfully' }
      format.json { head :no_content }
    end
  end

  private

  def set_category
    @category = Category.includes(:activities).find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end

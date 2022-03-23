class CategoriesController < ApplicationController

  def index
    @categories = Category.all.where(user_id: current_user.id)
  end

  def show; end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(user_id: current_user.id, name: category_params[:name], icon: category_params[:icon])
    if @category.save
      flash[:notice] = 'Category created successfully' 
    else
      flash[:notice] = 'Try again, Something went wrong' 
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
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
  
  
end

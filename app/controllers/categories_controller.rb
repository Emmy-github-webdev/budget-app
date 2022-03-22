class CategoriesController < ApplicationController

  def index
    @categories = Category.find_by(user_id: current_user.id)
  end

  def create
    @categories = current_user.categories.create!(
      name: params[:category][:name],
      icon: params[:category][:icon]
    )
    respond_to do |format|
      if @categories.save
        format.html { redirect_to  user_categories_path, notice: 'Category created successfully' }
        format.json { render :show, status: :created, location: @categories }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @categories.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @categories.delete
    respond_to do |format|
      format.html { redirect_to  user_categories_path, notice: 'Category deleted successfully' }
      format.json { head :no_content }
    end
  end

  private

  def set_category
    @categories = Category.find(params[:id])
  end

  def category_params
    params.permit(:name, :icon)
  end
  
  
end

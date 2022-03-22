class CategoriesController < ApplicationController

  def index

    @categories = Category.find_by(user_id: current_user.id)
  end
  
end

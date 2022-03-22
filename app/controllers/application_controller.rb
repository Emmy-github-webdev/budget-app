class ApplicationController < ActionController::Base
  include DeviseWhitelist

  def after_sign_in_path_for(resource)
    user_categories_path(current_user)
  end
end

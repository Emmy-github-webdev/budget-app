class ApplicationController < ActionController::Base
  include DeviseWhitelist

  def after_sign_in_path_for(_resource)
    categories_path
  end
end

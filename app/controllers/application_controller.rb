class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  helper_method :current_user
  hide_action :current_user
  # Prevent CSRF attacks by raising an exception.
  before_filter :authenticate_user!
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    projects_path(resource)
  end

end

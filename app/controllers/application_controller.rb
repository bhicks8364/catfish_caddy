class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_latest
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def after_sign_in_path(resource)
    root_path
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :full_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :full_name, :team_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :full_name, :team_id])
    # devise_parameter_sanitizer.for(:account_update) << [:username, :full_name, :team_id]
  end
  def set_latest
    @current_tournament = Tournament.current.last
  end
end

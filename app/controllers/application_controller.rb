class ApplicationController < ActionController::Base

  
  def current_user_seller?
    current_user && current_user.is_seller
  end

  helper_method :current_user_seller?

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :is_seller])
  end
end
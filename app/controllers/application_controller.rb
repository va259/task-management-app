class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_user_can_edit?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation]
    )
    devise_parameter_sanitizer.permit(
      :account_update, keys: [:password, :password_confirmation, :current_password]
    )
  end

  def current_user_can_edit?(task)
    user_signed_in? && task.user == current_user
  end
end

class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_user_cookie

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :email])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email])
  end

  def set_user_cookie
    cookies[:user_id] = current_user.id if user_signed_in?
  end
end

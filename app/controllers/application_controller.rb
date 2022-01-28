class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  protect_from_forgery with: :null_session

  private

  def authenticate_admin_user!
    return unless !current_user || current_user.customer?

    redirect_to new_user_session_path
  end

  def set_locale
    locale_in_cookies = I18n.available_locales.map(&:to_s).include?(cookies[:locale])
    I18n.locale = locale_in_cookies ? cookies[:locale] : I18n.default_locale
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |parameter_devise| parameter_devise.permit(:first_name, :last_name, :phone, :email, :password, :password_confirmation) }

    devise_parameter_sanitizer.permit(:account_update) { |parameter_devise| parameter_devise.permit(:first_name, :last_name, :phone, :email, :password, :password_confirmation) }
  end
end

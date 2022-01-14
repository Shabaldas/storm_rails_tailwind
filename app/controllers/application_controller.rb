class ApplicationController < ActionController::Base
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
end

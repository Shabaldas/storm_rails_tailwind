class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  
  def authenticate_admin_user!
    return unless !current_user || current_user.customer?

    redirect_to new_user_session_path
  end
end

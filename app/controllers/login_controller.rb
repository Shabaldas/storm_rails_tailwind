class LoginController < ApplicationController
  def show_login_form
    render partial: “login/form”
    end
end

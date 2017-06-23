class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def verify_info object
    return if object
    render file: "public/404.html", layout: false
  end

  def logged_in_user
    return if logged_in?
    flash[:danger] = t ".must_login"
    redirect_to login_path
  end
end

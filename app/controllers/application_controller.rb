class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def verify_info object
    return if object
    render file: "public/404.html", layout: false
  end
end

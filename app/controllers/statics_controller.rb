class StaticsController < ApplicationController
  def welcome
    @post = current_user.posts.build if logged_in?
  end

  def help
  end
end

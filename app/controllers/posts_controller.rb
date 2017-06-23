class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @post = current_user.posts.build post_params

    if @post.save
      flash[:success] = t ".created"
      redirect_to root_url
    else
      flash.now[:danger] = t ".failed"
      render "statics/welcome"
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = t ".deleted"
    else
      flash[:danger] = t ".not_deleted"
    end
    redirect_back fallback_location: root_path
  end

  private

  def post_params
    params.require(:post).permit :title, :content
  end

  def correct_user
    @post = current_user.posts.find_by id: params[:id]
    verify_info @post
  end
end

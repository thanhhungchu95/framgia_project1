class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_info, only: :destroy

  def create
    @post = Post.find_by id: params[:post_id]
    @comment = @post.comments
      .build user: current_user, content: params[:comment][:content]

    if @comment.save
      flash[:success] = t ".commented"
    else
      @comment.errors.add :content, t(".content_non_empty")
      flash[:danger] = t ".not_commented"
    end
    redirect_back fallback_location: root_path
  end

  def destroy
    if @comment.destroy
      flash[:success] = t ".deleted"
    else
      flash[:danger] = t ".not_deleted"
    end
    redirect_back fallback_location: root_path
  end

  private

  def correct_info
    @comment = Comment.find_by id: params[:id]
    verify_info @comment
  end
end

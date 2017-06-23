module UsersHelper
  def posts_for user
    Post.where(user_id: user.id)
      .select(:id, :title, :content, :user_id, :created_at)
      .sort_by_post_time.paginer(params[:page])
      .per Settings.user.helper.post_per_page
  end

  def feeds_for user
    current_user.feed.select(:id, :title, :content, :user_id, :created_at)
      .sort_by_post_time.paginer(params[:page])
      .per Settings.user.helper.post_per_page
  end
end

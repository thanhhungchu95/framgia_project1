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

  def users_list_for user, follow_type: Settings.user.relate.following
    if follow_type == Settings.user.relate.followers
      users = user.followers
    else
      users = user.following
    end

    users.select(:id, :user_name, :full_name).sort_by_name.paginer(params[:page])
      .per Settings.user.index.per_page
  end

  def follow_title_for follow_type
    follow_type.to_s.capitalize
  end
end

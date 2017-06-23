module PostsHelper
  def comments_for post
    Comment.where(post_id: post.id)
      .select(:id, :content, :user_id, :post_id, :created_at)
      .order(:created_at)
      # .paginer(params[:page])
      # .per Settings.user.helper.post_per_page
  end
end

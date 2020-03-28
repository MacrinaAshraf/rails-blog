module PostsHelper
  def post_current_user_name(post)
    if post.user.id == session[:id]
      'You'
    else
      post.user.name
    end
  end

  def post_belong_to_current_user(post)
    post.user.id == session[:id]
  end
end

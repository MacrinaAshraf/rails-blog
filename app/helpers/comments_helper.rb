module CommentsHelper
  def comment_current_user(comment)
    if comment.user.id == session[:id]
      'You'
    else
      comment.user.name
    end
  end

  def comment_belong_to_current_user(comment)
    comment.user.id == session[:id]
  end
end

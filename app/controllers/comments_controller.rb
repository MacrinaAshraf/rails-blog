class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.create(comment_params)
    redirect_to post_path(params[:post_id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@comment.post_id)
  end

  private

  def comment_params
    params.permit(:post_id, :content)
  end
end

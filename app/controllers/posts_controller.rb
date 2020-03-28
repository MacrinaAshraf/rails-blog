class PostsController < ApplicationController
  def index
    @posts = Post.all.order(:created_at).reverse_order
  end

  def show
    p " Session id = #{session[:id]}"
    return @post = Post.find(params[:id]), @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.persisted?
      redirect_to :root
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to :root
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.permit(:title, :content)
  end
end

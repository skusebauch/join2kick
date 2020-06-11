class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = policy_scope(Post)
    @followers_posts = @posts.select do |post|
      current_user.followings.include?(post.user)
    end
    @current_user_posts = current_user.posts
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    authorize @post
    if @post.save
      redirect_to posts_path
    else
      render "posts/index"
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end

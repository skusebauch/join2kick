class LikesController < ApplicationController
  before_action :find_post, :find_like, only: [:destroy]

  def create
    @post = Post.find(params[:post_id])
    if already_liked?
      flash[:notice] = "You can't like more than once"
      @like = Like.last
      authorize(@like)
    else
      @like = Like.create(user_id: current_user.id, post_id: @post.id)
      authorize(@like)
    end
      redirect_to posts_path(anchor: "post-#{@post.id - 1}")
  end

  def find_like
    @like = Like.find(params[:id])
  end

  def index
    @like = Like.new
    @likes = policy_scope(Like)
  end

  def destroy
  if !(already_liked?)
    flash[:notice] = "Cannot unlike"
  else
    @like.destroy
     authorize(@like)
  end
  redirect_to posts_path(anchor: "post-#{@post.id - 1}")
  end

  private

  def already_liked?
  Like.where(user_id: current_user.id, post_id:
  params[:post_id]).exists?
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end

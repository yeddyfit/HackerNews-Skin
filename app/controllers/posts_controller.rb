class PostsController < ApplicationController
  before_action :authenticate_user!

  def index 
    @posts = Post.all
  end

  def show 
    @post = Post.find(params["id"])
  end

  def createComment
    @post = Post.find(params["id"])
    @comment = current_user.comments.create(post_id: @post.id, commentText: params[:comment])
    redirect_to post_path
  end

  def comment_params
    params.require(:comment).permit(:commentText)
  end
end
class PostsController < ApplicationController
  # before_action :authenticate_user!

  def index 
    @posts = Post.all
  end

  def show 
    @post = Post.find(params["id"])
  end

  def createComment
    if params[:comment] != ""
      @post = Post.find(params["id"])
      @comment = current_user.comments.create(post_id: @post.id, commentText: params[:comment])
    end
    redirect_to post_path(params["id"])
  end


  private
  def comment_params
    params.require(:comment).permit(:commentText)
  end
end
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
    @comment = current_user.comments.create(post_id: @post.id, commentText: comment_params)

    if @listing.errors.any?
      render "new"
    else 
      redirect_to post_path
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:commentText)
  end
end
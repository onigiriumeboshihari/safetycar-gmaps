class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json:{ post: @comment }
    else
      @post = @comment.post
      @comments = @post.comments
      render 'post/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
          .merge(user_id: current_user.id, post_id: params[:post_id])
  end
end

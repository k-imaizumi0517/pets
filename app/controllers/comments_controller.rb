class CommentsController < ApplicationController
  before_action :move_to_top, only: [:create]

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to post_path(@comment.post), notice: 'コメントしました' }
        format.json
      end
    else
      flash.now[:alert] = 'コメントを入力してください。'
      render template: "posts/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(post_id: params[:post_id], user_id: current_user.id)
  end

  def move_to_top
    redirect_to root_path unless user_signed_in?
  end
end

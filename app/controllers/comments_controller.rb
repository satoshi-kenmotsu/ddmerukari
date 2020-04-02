class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      # 保存に成功した時の処理
      respond_to do |format|
        format.json
      end
    else
      # 保存に失敗した時の処理
      redirect_to item_path(@comment.item_id)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

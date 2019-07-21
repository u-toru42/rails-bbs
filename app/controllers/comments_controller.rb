class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      flash[:notice] = 'コメントを投稿しました'
      redirect_to comment.board
    else #redirect_to :back, flash:→Rails5.0~以降では非推奨なので、以下に変換
      redirect_back fallback_location: {
        comment: comment,
        error_messages: comment.errors.full_messages
      }
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.delete
    redirect_to comment.board, flash: { notice: 'コメントが削除されました。' }
  end

  private

  def comment_params
    params.require(:comment).permit(:board_id, :name, :comment)
  end
end

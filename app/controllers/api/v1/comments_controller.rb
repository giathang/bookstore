class Api::V1::CommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.create(comment_params)
  end
  def destroy
    @book = Book.find(params[:book_id])
    @comment = @book.comment.find(params[:id])
    @comment.destroy
  end
  private
  def comment_params
    params.require(:comment).permit(:commenter,:body)
  end
end
class Api::V1::CommentsController < ApplicationController
  before_action :find_book , only: [:create, :destroy]

  def create
    unless @book.nil?
      @comment = @book.comments.create(comment_params)
    end
  end

  def destroy
    unless @book.nil?
      @comment = @book.comments.find_by(id: params[:id])
      @comment.destroy
    end
  end
  private

  def find_book
    @book = Book.find_by(id: params[:book_id])
  end

  def comment_params
    params.require(:comment).permit(:commenter,:body)
  end
end
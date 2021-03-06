class CommentsController < ApplicationController
	before_action :find_book , only: [:create, :destroy]

	def create
			@comment = @book.comments.create(comment_params)
		redirect_to book_path(@book)
	end

	def destroy
			@comment = @book.comments.find(params[:id])
			@comment.destroy
		redirect_to book_path(@book)
	end

	private

	def find_book
		@book = Book.find_by(id: params[:book_id])
	end

	def comment_params
		params.require(:comment).permit(:commenter,:body)
	end
end

class Api::V1::BooksController < ApplicationController
  before_action :find_book, only: [:show, :update, :destroy]
  skip_before_filter :verify_authenticity_token, only: :create

  # GET /api/v1/books
  def index
    @books = Book.all
  end

  # GET /api/v1/books/:id
  def show
  end

  # POST/api/v1/books
  def create
    @book = Book.create(book_params)
  end

  # PUT /api/v1/books/:id
  def update
    @book.update(book_params)
  end

  # DELETE/api/v1/books/:id
  def destroy
    @book.destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :isbn, :des)
  end

  def find_book
    @book = Book.find(params[:id])
  end
end
class Api::V1::BooksController < ApplicationController
  before_action :find_book, only: [:show, :update, :destroy]

  # GET /api/v1/books
  def index
    @books = Book.all
  end

  # GET /api/v1/books/:id
  def show
    unless @book.nil?
      @book
    end
  end

  # POST/api/v1/books
  def create
    @book = Book.create(book_params)
  end

  # PUT /api/v1/books/:id
  def update
    unless @book.nil?
      @book.update(book_params)
    end
  end

  # DELETE/api/v1/books/:id
  def destroy
    unless @book.nil?
      @book.destroy
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :isbn, :des, :category_id)
  end

  def find_book
    @book = Book.find_by(id: params[:id])
  end
end

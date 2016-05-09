class Api::V1::BooksController < ApplicationController
  before_action :find_book, only: [:show, :update, :destroy]
  #/api/v1/books get
  def index
    @books = Book.all
  end
  #/api/v1/books/:id get
  def show
  end
  #/api/v1/books post
  def create
    @book = Book.create(book_params)
  end
  #/api/v1/books/:id put
  def update
    @book = Book.update(book_params)
  end
  #/api/v1/books/:id delete
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
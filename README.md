# WELCOME

### This is Bookstore Application

### references
    1. [Awesome Ruby]: https://github.com/markets/awesome-ruby
    2. [Rails style guide]: https://github.com/bbatsov/rails-style-guide
    3. [REST API]: http://www.restapitutorial.com/
    4. [jbuilder]: https://github.com/rails/jbuilder

### function 1: use scaffold create Book
> rails g scaffold Book title:string des:text isbn:integer

### funciton 2: create model Comment anh create relation to Book
> class Comment
>     belongs_to :book
> end


> class Book
>    has_may :comments
> end
### function 3: create API for book controller

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
            @book.destroy
          end

          private

          def book_params
            params.require(:book).permit(:title, :isbn, :des)
          end

          def find_book
            @book = Book.find_by(id: params[:id])
          end
        end





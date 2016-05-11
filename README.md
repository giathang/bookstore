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

### function 3: create API for book controller and comment controller
       1. controller/api/v1/books_controller.rb
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
                params.require(:book).permit(:title, :isbn, :des)
              end

              def find_book
                @book = Book.find_by(id: params[:id])
              end
            end
        2. controller/api/v1/comments_controller.rb
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


### Function 4: Create Routes for API and create View Api cho every action
    1. config/routes

         namespace :api, defaults: {format: 'json'} do
            namespace :v1 do
              resources :books
            end
          end

    2. view/api/v1/books
        ..* create.json.jbuilder
            json.extract! @book, :id, :title, :des, :isbn
        ..* destroy.json.jbuilder
            if @book.nil?
              json.error "not found any author"
            else
              json.success "delete sucess"
            end
        ..* index.json.jbuilder
            json.books @books do |book|
              json.extract! book, :isbn, :title, :des
              json.comments book.comments do |comment|
                json.extract! comment, :commenter, :body
              end
              json.authors book.authors do |author|
                json.extract! author, :name
              end
            end
        ..* show.json.jbuilder
            if @book.nil?
              json.error("not found any book")
            else
              json.book do
                json.extract! @book, :id, :isbn, :title, :des

                json.comments @book.comments do |comment|
                  json.extract! comment, :commenter, :body
                end
                json.authors @book.authors do |author|
                  json.extract! author, :name
                end
              end
            end
        ..* update.json.jbuilder
            if @book.nil?
              json.error ("not find any book")
            else
              json.extract! @book, :id, :title, :des, :isbn
            end
        3. view/api/v1/comments
            ..* create.json.jbuilder
                 if @book.nil?
                   json.error "Not found any book"
                 else
                   json.comment do
                     json.extract! @comment, :id, :book_id, :commenter, :body
                   end
                 end
            ..* destroy.json.jbuilder
                if @book.nil?
                  json.error "Not found any book"
                else
                  json.success "Delete success"
                end
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

models/comment.rb
> class Comment < ActiveRecord::Base
>     belongs_to :book
> end

models/book.rb
> class Book < ActiveRecord::Base
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
        * create.json.jbuilder
            json.extract! @book, :id, :title, :des, :isbn
        * destroy.json.jbuilder
            if @book.nil?
              json.error "not found any author"
            else
              json.success "delete sucess"
            end
        * index.json.jbuilder
            json.books @books do |book|
              json.extract! book, :isbn, :title, :des
              json.comments book.comments do |comment|
                json.extract! comment, :commenter, :body
              end
              json.authors book.authors do |author|
                json.extract! author, :name
              end
            end
        * show.json.jbuilder
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
        * update.json.jbuilder
            if @book.nil?
              json.error ("not find any book")
            else
              json.extract! @book, :id, :title, :des, :isbn
            end
    3. view/api/v1/comments
            * create.json.jbuilder
                 if @book.nil?
                   json.error "Not found any book"
                 else
                   json.comment do
                     json.extract! @comment, :id, :book_id, :commenter, :body
                   end
                 end
            * destroy.json.jbuilder
                if @book.nil?
                  json.error "Not found any book"
                else
                  json.success "Delete success"
                end

### Function 5: create model Assignments and Author and create relation to book
        models/assignment.rb
        class Assignment < ActiveRecord::Base
          belongs_to :book
          belongs_to :author
        end

        models/author.rb
        class Author < ActiveRecord::Base
          has_many :assignments
          has_many :book, through: :assignments
        end

        models/books.rb
        class Book < ActiveRecord::Base
        	has_many :comments,  dependent: :destroy
          has_many :assignments
          has_many :authors, through: :assignments
        end

### Function 6: create API Author Controller and View
   1. Author Controller

        class Api::V1::AuthorsController < ApplicationController
          before_action :find_author, only: [:show, :update, :destroy]

          def index
            @authors = Author.all
          end

          def show
          end

          def create
            @author = Author.create(author_params)
          end

          def update
            unless @author.nil?
              @author.update(author_params)
            end
          end

          def destroy
            unless @author.nil?
              @author.destroy
            end
          end

          private

          def author_params
            params.require(:author).permit(:name)
          end

          def find_author
            @author= Author.find_by(id: params[:id])
          end
        end
   2. author View

        >create.json.jbuilder

            json.extract! @author, :name

        >destroy.json.jbuilder

            if @author.nil?
              json.error "not found any author"
            else
              json.success "delete sucess"
            end

        >index.json.jbuilder

            json.authors @authors do |author|
              json.extract! author, :name
              json.books author.book do |book|
                  json.extract! book,:id,:title
              end
            end

        >show.json.jbuilder

            if @author.nil?
              json.error ("not found any author")
            else
              json.author do
                json.extract! @author,:name
                json.books @author.book do |book|
                  json.extract! book, :id, :title
                end
              end
            end

        >update.json.jbuilder

             if @author.nil?
               json.error ("not found any author")
             else
               json.extract! @author, :name
             end

### Function 7: after create API and use postman for test API

### Fuction 8: Create function authenticate Login

# Thanks you


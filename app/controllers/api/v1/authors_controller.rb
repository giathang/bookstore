class Api::V1::AuthorsController < ApplicationController
  before_action :find_author, only: [:show, :update, :destroy]
  skip_before_filter :verify_authenticity_token, only: :create

  def index
    @authors = Author.all
  end

  def show
  end

  def create
    @author = Author.create(author_params)
  end

  def update
    @author.update(author_params)
  end

  def destroy
    @author.destroy
  end

  private

  def author_params
    params.require(:author).permit(:name)
  end

  def find_author
    @author= Author.find(params[:id])
  end
end
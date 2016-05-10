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
class Api::V1::CategoriesController < ApplicationController
  before_action :find_category, only: [:update, :destroy, :show]

  #GET api/v1/categories
  def index
    @categories = Category.all

  end

  #GET api/v1/categories/:id
  def show
    unless @category.nil?
      @category
    end
  end

  # POST api/v1/categories
  def create
    @category = Category.create(category_params)
  end

  # PUT api/v1/categories/:id
  def update
    unless @category.nil?
      @category.update(category_params)
    end
  end

  # DELETE api/v1/categories/:id
  def destroy
    unless @category.nil?
      @category.destroy
    end
  end

  private
  def find_category
    @category = Category.find_by(id: params[:id])
  end

  def category_params
    params.require(:category).permit(:category_name)
  end
end
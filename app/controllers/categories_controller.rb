# app/controllers/categories_controller.rb

class CategoriesController < ApplicationController
  before_action :authenticate_user!
  include CategoriesHelper

  def index
    @categories = current_user.categories
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  private

  def category_total_amount(category)
    category.transactions.sum(:amount)
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end

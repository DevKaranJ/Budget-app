# app/helpers/categories_helper.rb

module CategoriesHelper
  def category_total_amount(category)
    category.transactions.sum(:amount)
  end
end

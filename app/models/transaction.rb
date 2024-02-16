class Transaction < ApplicationRecord
  validates :name, :amount, presence: true
  belongs_to :category

  def self.create_with_unique_category(name, amount, category_name)
    category = Category.unique_name(category_name)
    create(name:, amount:, category:)
  end
end

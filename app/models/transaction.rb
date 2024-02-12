class Transaction < ApplicationRecord
  validates :name, :amount, presence: true
  belongs_to :category
  belongs_to :user

  def self.create_with_unique_category(name, amount, user, category_name)
    category = Category.unique_name(category_name, user.id)
    create(name: name, amount: amount, category: category, user: user)
  end
end

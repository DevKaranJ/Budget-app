class User < ApplicationRecord
  validates :name, presence: true
  has_many :categories, dependent: :destroy  # Ensure categories are deleted with user
  has_many :transactions, dependent: :destroy  # Ensure transactions are deleted with user
end

# frozen_string_literal: true

class Category < ApplicationRecord
  validates :name, :icon, presence: true
  belongs_to :user, inverse_of: :categories
  has_many :transactions, dependent: :destroy # Ensure transactions are deleted with category

  def self.unique_name(name, user_id)
    find_by(name:, user_id:) || new(name:, user_id:)
  end
end

class Category < ApplicationRecord
  validates :name, :icon, presence: true
  belongs_to :user, inverse_of: :categories
  has_many :transactions, dependent: :destroy

  def self.unique_name(name, icon, user_id)
    find_by(name: name, icon: icon, user_id: user_id) || new(name: name, icon: icon, user_id: user_id)
  end
end

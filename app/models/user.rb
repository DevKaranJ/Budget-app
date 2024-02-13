class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  has_one_attached :profile_pic # Active Storage
  has_many :categories, dependent: :destroy # Ensure categories are deleted with user
  has_many :transactions, dependent: :destroy # Ensure transactions are deleted with user
end

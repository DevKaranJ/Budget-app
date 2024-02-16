require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(name: 'John Doe', email: 'john.doe@example.com', password: 'password') }

  describe 'associations' do
    it 'should belong to user' do
      expect(Category.reflect_on_association(:user).macro).to eq(:belongs_to)
    end

    it 'should have many transactions' do
      expect(Category.reflect_on_association(:transactions).macro).to eq(:has_many)
    end
  end

  describe '.unique_name' do
    context 'when category does not exist' do
      it 'should create a new category' do
        category = Category.unique_name('Groceries', 'shopping_cart', user.id)
        expect(category).to be_a_new(Category)
        expect(category.name).to eq('Groceries')
        expect(category.icon).to eq('shopping_cart')
        expect(category.user_id).to eq(user.id)
      end
    end

    context 'when category exists' do
      before do
        Category.create(name: 'Groceries', icon: 'shopping_cart', user_id: user.id)
      end

      it 'should return the existing category' do
        category = Category.unique_name('Groceries', 'shopping_cart', user.id)
        expect(category).to be_a(Category)
        expect(category.name).to eq('Groceries')
        expect(category.icon).to eq('shopping_cart')
        expect(category.user_id).to eq(user.id)
      end
    end
  end
end

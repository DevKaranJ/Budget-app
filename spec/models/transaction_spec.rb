require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'validations' do
    it 'should validate presence of name' do
      transaction = Transaction.new(name: nil, amount: 100, category: Category.new)
      expect(transaction).to be_invalid
      expect(transaction.errors[:name]).to include("can't be blank")
    end

    it 'should validate presence of amount' do
      transaction = Transaction.new(name: 'Test Transaction', amount: nil, category: Category.new)
      expect(transaction).to be_invalid
      expect(transaction.errors[:amount]).to include("can't be blank")
    end
  end

  describe 'associations' do
    it 'should belong to category' do
      association = described_class.reflect_on_association(:category)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end

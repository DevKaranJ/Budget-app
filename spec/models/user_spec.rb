require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'validates presence of name' do
      user = User.new
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end
  end

  describe 'associations' do
    it 'has one attached profile_pic' do
      user = User.create(name: 'Test User')
      expect(user).to respond_to(:profile_pic)
    end
  end
end

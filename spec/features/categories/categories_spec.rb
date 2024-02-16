require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
  describe 'GET /categories' do
    let(:user) { User.create(email: 'user@example.com', password: 'password') }

    before do
      sign_in user
    end

    it 'allows the user to sign out' do
      visit categories_path
    end

    it 'displays category name and icon' do
      category = Category.create(name: 'Test Category', icon: 'test-icon.png')
      visit categories_path
    end
  end
end

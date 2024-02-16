require 'rails_helper'

RSpec.feature 'Add New Category Page', type: :feature do
  before(:each) do
    @user = User.create!(name: 'first user', email: 'user@example.com', password: 'password')
    visit new_user_session_path
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Test Submit'
  end

  scenario 'displays the form for adding a new category' do
    visit new_category_path
    expect(page).to have_content('Add New Category')
    expect(page).to have_selector('form[action="/categories"][method="post"]')
    expect(page).to have_field('category_name')
    expect(page).to have_field('category_icon')
    expect(page).to have_button('Create Category')
  end

  scenario 'successfully adds a new category' do
    visit new_category_path
    fill_in 'category_name', with: 'Groceries'
    select "Burger", from: 'category_icon'
    click_on 'Create Category'
    expect(page).to have_current_path(categories_path)
  end
end

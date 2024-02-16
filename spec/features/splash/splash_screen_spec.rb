require 'rails_helper'

RSpec.feature "SplashScreen", type: :feature do
  scenario "User visits splash screen" do
    visit '/'
    
    expect(page).to have_css("link[href*='splashScreen']")

    expect(page).to have_selector(".container")
    expect(page).to have_selector(".card")
    expect(page).to have_selector(".card-content")

    expect(page).to have_content("BudgetBuddy")

    expect(page).to have_link("Log In", href: new_user_session_path)
    expect(page).to have_link("Sign Up", href: new_user_registration_path)
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'UserLogins', type: :feature do
  let!(:user) { create(:user) }

  before do
    visit root_path
  end

  feature 'User logs in' do
    scenario 'with valid credentials', js: true do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log in'

      expect(page).to have_content('A list of all the projects.')
    end

    scenario 'with invalid email', js: true do
      fill_in 'user_email', with: 'invalid@'
      fill_in 'user_password', with: user.password
      click_button 'Log in'

      expect(page).to have_content('Login to your account')
    end

    scenario 'with invalid password', js: true do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: 'invalid'
      click_button 'Log in'

      expect(page).to have_content('Login to your account')
    end
  end
end

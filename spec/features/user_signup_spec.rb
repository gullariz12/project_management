# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'UserSignups', type: :feature do
  let!(:user) { create(:user, email: 'obiwan@jedimail.com') }
  let!(:email) { Faker::Internet.email }

  before do
    visit root_path
  end

  feature 'User signs up' do
    scenario 'with valid credentials' do
      click_link 'Sign up'
      fill_in 'user_email', with: email
      fill_in 'user_first_name', with: Faker::Name.first_name
      fill_in 'user_last_name', with: Faker::Name.last_name
      fill_in 'user_password', with: 'vAl1dP@ssw0rd'
      fill_in 'user_password_confirmation', with: 'vAl1dP@ssw0rd'

      expect { click_button 'Sign up' }.to change(User, :count).by(1)
    end

    scenario 'with non-matching password confirmation' do
      click_link 'Sign up'
      fill_in 'user_email', with: email
      fill_in 'user_first_name', with: Faker::Name.first_name
      fill_in 'user_last_name', with: Faker::Name.last_name
      fill_in 'user_password', with: 'vAl1dP@ssw0rd'
      fill_in 'user_password_confirmation', with: 'doesnotmatch'

      click_button 'Sign up'

      expect(page).to have_content("doesn't match Password")
    end

    scenario 'with blank first name' do
      click_link 'Sign up'
      fill_in 'user_email', with: email
      fill_in 'user_first_name', with: ''
      fill_in 'user_last_name', with: Faker::Name.last_name
      fill_in 'user_password', with: 'vAl1dP@ssw0rd'
      fill_in 'user_password_confirmation', with: 'vAl1dP@ssw0rd'

      click_button 'Sign up'

      expect(page).to have_content("can't be blank")
    end

    scenario 'with blank last name' do
      click_link 'Sign up'
      fill_in 'user_email', with: email
      fill_in 'user_first_name', with: Faker::Name.first_name
      fill_in 'user_last_name', with: ''
      fill_in 'user_password', with: 'vAl1dP@ssw0rd'
      fill_in 'user_password_confirmation', with: 'vAl1dP@ssw0rd'

      click_button 'Sign up'

      expect(page).to have_content("can't be blank")
    end

    scenario 'with invalid email' do
      click_link 'Sign up'
      fill_in 'user_email', with: 'invalid'
      fill_in 'user_first_name', with: Faker::Name.first_name
      fill_in 'user_last_name', with: ''
      fill_in 'user_password', with: 'vAl1dP@ssw0rd'
      fill_in 'user_password_confirmation', with: 'vAl1dP@ssw0rd'

      click_button 'Sign up'

      expect(page).to have_content('is invalid')
    end

    scenario 'with email already taken' do
      click_link 'Sign up'
      fill_in 'user_email', with: user.email
      fill_in 'user_first_name', with: Faker::Name.first_name
      fill_in 'user_last_name', with: Faker::Name.last_name
      fill_in 'user_password', with: 'vAl1dP@ssw0rd'
      fill_in 'user_password_confirmation', with: 'vAl1dP@ssw0rd'

      click_button 'Sign up'

      expect(page).to have_content('already been taken')
    end
  end
end

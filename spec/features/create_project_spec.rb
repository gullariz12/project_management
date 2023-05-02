# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'CreateProject', type: :feature do
  let!(:user) { create(:user) }

  before do
    login_as user, scope: :user
    visit root_path
  end

  feature 'Create Project' do
    scenario 'signed in user can create new project', js: true do
      project_title = Faker::Lorem.sentence

      click_link 'Add Project'

      fill_in 'project_title', with: project_title
      click_button 'Save'

      expect(page).to have_content(project_title)
    end

    scenario 'project cannot be created without title', js: true do
      click_link 'Add Project'

      fill_in 'project_title', with: ''
      click_button 'Save'

      expect(page).to have_content("Title can't be blank")
    end
  end
end

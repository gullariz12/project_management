# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'ProjectsListing', type: :feature do
  let!(:user) { create(:user) }
  let!(:projects) { create_list(:project, 3, user:) }

  before do
    login_as user, scope: :user
    visit root_path
  end

  feature 'Project Listing' do
    scenario 'signed in user can see projects listing', js: true do
      expect(page).to have_content(projects.first.title)
    end

    scenario 'signed in user can see new project link', js: true do
      expect(page).to have_link('Add Project')
    end
  end
end

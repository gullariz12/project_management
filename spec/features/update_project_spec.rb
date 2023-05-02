# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'UpdateProject', type: :feature do
  let!(:user) { create(:user) }
  let!(:project) { create(:project, user:) }

  before do
    login_as user, scope: :user
    visit project_path(project)
  end

  feature 'Update Project' do
    scenario 'signed in user can update project', js: true do
      project_title = Faker::Lorem.sentence

      page.find('svg.svg-inline--fa.fa-pencil').click

      fill_in 'project_title', with: project_title
      click_button 'Save'

      expect(page).to have_content(project_title)
    end

    scenario 'project cannot be update title as blank', js: true do
      page.find('svg.svg-inline--fa.fa-pencil').click

      fill_in 'project_title', with: ''
      click_button 'Save'

      expect(page).to have_content("Title can't be blank")
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'ProjectsShow', type: :feature do
  let!(:user) { create(:user) }
  let!(:project) { create(:project, user:) }

  before do
    login_as user, scope: :user
    visit project_path(project)
  end

  feature 'Project Details' do
    scenario 'signed in user can see project details', js: true do
      expect(page).to have_content(project.title)
    end

    scenario 'signed in user can see project edit icon', js: true do
      expect(page).to have_css('svg.svg-inline--fa.fa-pencil')
    end
  end
end

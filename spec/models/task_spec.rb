# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'associations' do
    it 'belongs to user' do
      user = FactoryBot.create(:user)
      task = FactoryBot.create(:task, user:)

      expect(task.user).to eq(user)
    end

    it 'belongs to project' do
      project = FactoryBot.create(:project)
      task = FactoryBot.create(:task, project:)

      expect(task.project).to eq(project)
    end

    it 'belongs to location' do
      location = FactoryBot.create(:location)
      task = FactoryBot.create(:task, location:)

      expect(task.location).to eq(location)
    end
  end

  describe 'enums' do
    it 'defines priority as an enum with the correct values and default value' do
      task = FactoryBot.create(:task)

      expect(task.priority).to eq('normal')
      expect(Task::PRIORITIES).to include(low: 'low', high: 'high', urgent: 'urgent',
                                          normal: 'normal')
    end
  end
end

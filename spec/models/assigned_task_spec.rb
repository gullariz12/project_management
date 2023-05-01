# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AssignedTask, type: :model do
  describe 'associations' do
    it 'belongs to a user' do
      user = FactoryBot.create(:user)
      assigned_task = FactoryBot.create(:assigned_task, user:)

      expect(assigned_task.user).to eq(user)
    end

    it 'belongs to a task' do
      task = FactoryBot.create(:task)
      assigned_task = FactoryBot.create(:assigned_task, task:)

      expect(assigned_task.task).to eq(task)
    end

    it 'belongs to a project' do
      project = FactoryBot.create(:project)
      assigned_task = FactoryBot.create(:assigned_task, project:)

      expect(assigned_task.project).to eq(project)
    end
  end
end

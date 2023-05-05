# frozen_string_literal: true

FactoryBot.define do
  factory :assigned_task do
    task { create(:task) }
    user { create(:user) }
  end
end

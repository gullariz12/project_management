# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    user { create(:user) }
    project { create(:project) }
    location { create(:location) }
    title { Faker::Lorem.sentence }
  end
end

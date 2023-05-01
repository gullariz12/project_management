# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    title { Faker::Lorem.sentence }
    user { create(:user) }
  end
end

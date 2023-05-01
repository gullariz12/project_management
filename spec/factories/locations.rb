# frozen_string_literal: true

FactoryBot.define do
  factory :location do
    longitude { Faker::Address.longitude }
    latitude { Faker::Address.latitude }
    coords { "POINT(#{longitude} #{latitude})" }
  end
end

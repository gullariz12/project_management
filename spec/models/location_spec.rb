# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'validations' do
    it 'validates presence of longitude' do
      location = Location.new(latitude: 0)

      expect(location.valid?).to be(false)
      expect(location.errors[:longitude]).to include("can't be blank")
    end

    it 'validates presence of latitude' do
      location = Location.new(longitude: 0)

      expect(location.valid?).to be(false)
      expect(location.errors[:latitude]).to include("can't be blank")
    end
  end
end

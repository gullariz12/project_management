# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:user) { FactoryBot.create(:user) }

  describe 'validations' do
    it 'is invalid without a title' do
      project = described_class.new(user:)
      expect(project).to_not be_valid
      expect(project.errors[:title]).to include("can't be blank")
    end

    it 'is valid with a title' do
      project = described_class.new(title: Faker::Lorem.sentence, user:)
      expect(project).to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end

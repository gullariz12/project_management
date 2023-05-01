# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new }

  it 'is valid with valid attributes' do
    subject.email = Faker::Internet.email
    subject.first_name = Faker::Name.first_name
    subject.last_name = Faker::Name.last_name
    subject.password = Faker::Internet.password

    expect(subject).to be_valid
  end

  it 'is not valid without a first name' do
    subject.last_name = Faker::Name.last_name
    subject.email = Faker::Internet.email
    subject.password = Faker::Internet.password

    expect(subject).to_not be_valid
  end

  it 'is not valid without a last name' do
    subject.first_name = Faker::Name.first_name
    subject.email = Faker::Internet.email
    subject.password = Faker::Internet.password

    expect(subject).to_not be_valid
  end

  it 'has many projects' do
    assc = described_class.reflect_on_association(:projects)
    expect(assc.macro).to eq :has_many
  end

  it 'has many assigned tasks' do
    assc = described_class.reflect_on_association(:assigned_tasks)
    expect(assc.macro).to eq :has_many
  end

  it 'has many created tasks' do
    assc = described_class.reflect_on_association(:created_tasks)
    expect(assc.macro).to eq :has_many
  end
end

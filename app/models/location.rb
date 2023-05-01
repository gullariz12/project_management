# frozen_string_literal: true

class Location < ApplicationRecord
  has_one :task, dependent: :destroy

  validates :longitude, :latitude, presence: true
end

# frozen_string_literal: true

class Location < ApplicationRecord
  has_one :task, dependent: :destroy

  validates :longitude, :latitude, presence: true

  before_validation :set_coords

  def nearest_address
    results = Geocoder.search([coords.y, coords.x])

    results.first.address
  end

  private

  def set_coords
    self.coords = "POINT(#{longitude} #{latitude})"
    self.coords = "SRID=4326;#{coords}"
  end
end

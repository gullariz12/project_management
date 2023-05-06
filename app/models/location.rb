# frozen_string_literal: true

class Location < ApplicationRecord
  has_one :task, dependent: :destroy

  validates :longitude, :latitude, presence: true

  before_validation :set_coords_and_address

  def nearest_address
    results = Geocoder.search([self.coords.y, self.coords.x])

    results.first.address
  end

  private

  def set_coords_and_address
    self.coords = "POINT(#{longitude} #{latitude})"
    self.coords = "SRID=4326;#{coords}"
    self.address = nearest_address
  end
end

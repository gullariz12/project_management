# frozen_string_literal: true

class Task < ApplicationRecord
  PRIORITIES = {
    low: 'low',
    high: 'high',
    urgent: 'urgent',
    normal: 'normal'
  }.freeze

  enum priority: PRIORITIES

  belongs_to :user
  belongs_to :project
  belongs_to :location, optional: true
  has_one :assigned_task, dependent: :destroy

  has_rich_text :description

  def add_location(address)
    return if address.blank?

    results = Geocoder.search(address)

    return if results.first.blank?

    coordinates = results.first.coordinates
    location = Location.where(latitude: coordinates[0], longitude: coordinates[1]).first_or_create!

    # rubocop:disable Rails/SkipsModelValidations
    update_column :location_id, location.id
    # rubocop:enable Rails/SkipsModelValidations
  end
end

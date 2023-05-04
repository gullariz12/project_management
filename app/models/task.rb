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
  has_one :assigned_task

  has_rich_text :description
end

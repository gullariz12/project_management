# frozen_string_literal: true

class AssignedTask < ApplicationRecord
  belongs_to :user
  belongs_to :task
  belongs_to :project
end

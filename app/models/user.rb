# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects, dependent: :destroy
  has_many :assigned_tasks, dependent: :destroy
  has_many :created_tasks, class_name: 'Task', dependent: :destroy

  validates :first_name, :last_name, presence: true

  def name
    "#{first_name} #{last_name}"
  end

  def assigned_task_locations
    assigned_tasks.includes(task: :location).map do |at|
      [at.task.location&.latitude, at.task.location&.longitude].compact_blank
    end.compact_blank
  end
end

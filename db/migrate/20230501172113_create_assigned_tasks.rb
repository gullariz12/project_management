class CreateAssignedTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :assigned_tasks do |t|
      t.belongs_to :user
      t.belongs_to :task
      t.belongs_to :project
      t.belongs_to :location

      t.timestamps
    end
  end
end

class RemoveProjectIdFromAssignedTasks < ActiveRecord::Migration[7.0]
  def change
    remove_reference :assigned_tasks, :project
  end
end

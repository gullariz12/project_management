class RemoveLocationIdFromAssignedTasks < ActiveRecord::Migration[7.0]
  def change
    remove_reference :assigned_tasks, :location
  end
end

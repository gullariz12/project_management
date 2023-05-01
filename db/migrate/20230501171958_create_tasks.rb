class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.belongs_to :user
      t.belongs_to :project
      t.belongs_to :location
      t.string :priority, null: false, default: 'normal'

      t.timestamps
    end
  end
end

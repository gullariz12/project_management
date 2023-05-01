class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.text :title
      t.belongs_to :user

      t.timestamps
    end
  end
end

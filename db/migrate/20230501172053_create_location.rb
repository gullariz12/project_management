class CreateLocation < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.st_point :coords, null: false, geographic: true
      t.float :longitude, null: false
      t.float :latitude, null: false
      t.timestamps

      t.index :coords, using: :gist
      t.index %i[latitude longitude]
    end
  end
end

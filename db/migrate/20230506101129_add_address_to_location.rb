class AddAddressToLocation < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :address, :text
  end
end

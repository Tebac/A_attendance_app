class AddLocationColToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :location_number, :string
  end
end

class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :location_name, default: '本社'
      t.string :location_type

      t.timestamps
    end
  end
end

class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :location_name, default: '本社'
      t.string :location_type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

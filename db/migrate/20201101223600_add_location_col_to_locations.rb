class AddLocationColToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :location_number, :string, default: "未設定", unique: true
  end
end

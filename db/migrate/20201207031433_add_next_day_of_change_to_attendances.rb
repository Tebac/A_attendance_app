class AddNextDayOfChangeToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :next_day_of_change, :string, default: "0"
  end
end

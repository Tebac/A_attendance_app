class AddCheckOvertimeToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :overtime_hours, :string
    add_column :attendances, :overtime_check, :string, default: "0"
  end
end

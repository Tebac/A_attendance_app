class AddScheduleItemToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :reason_for_change, :text
    add_column :attendances, :instructor_confirmation, :string
    add_column :attendances, :overtime_instructions, :text
    add_column :attendances, :instructor, :string
    add_column :attendances, :approval, :string
    add_column :attendances, :next_day, :string, default: "0"
  end
end

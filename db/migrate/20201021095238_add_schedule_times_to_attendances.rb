class AddScheduleTimesToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :schedule_started_at, :datetime, default: Time.current.change(hour: 10, min: 0, sec: 0)
    add_column :attendances, :schedule_finished_at, :datetime, default: Time.current.change(hour: 19, min: 0, sec: 0)
    add_column :attendances, :overtime, :datetime
    add_column :attendances, :end_instruction_time, :datetime
  end
end

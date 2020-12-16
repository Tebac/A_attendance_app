class AddScheduleTimesToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :schedule_started_at, :datetime
    add_column :attendances, :schedule_finished_at, :datetime
    add_column :attendances, :overtime, :datetime
    add_column :attendances, :end_instruction_time, :datetime
  end
end

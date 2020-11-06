class AddNoticeOvertimeToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :overtime_superior_id, :integer
    add_column :attendances, :overtime_status, :string
  end
end

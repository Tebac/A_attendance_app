class AddReplyOvertimeToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :overtime_approval, :integer, default: 1
    
  end
end

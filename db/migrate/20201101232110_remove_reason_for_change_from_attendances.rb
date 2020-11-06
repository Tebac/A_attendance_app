class RemoveReasonForChangeFromAttendances < ActiveRecord::Migration[5.1]
  def change
    remove_column :attendances, :reason_for_change, :text
  end
end

class AddReasonColToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :reason_change, :string
  end
end

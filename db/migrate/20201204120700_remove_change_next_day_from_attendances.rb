class RemoveChangeNextDayFromAttendances < ActiveRecord::Migration[5.1]
  def change
    remove_column :attendances, :change_next_day, :string
  end
end

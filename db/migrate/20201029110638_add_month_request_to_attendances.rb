class AddMonthRequestToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :month_request, :datetime
    add_column :attendances, :month_check, :string, default: "0"
    add_column :attendances, :month_approval, :integer, default: 1
  end
end

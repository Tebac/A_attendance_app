class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.datetime :schedule_finished_at, default: Time.current.change(hour: 19, min: 0, sec: 0)
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

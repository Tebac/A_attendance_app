require 'csv'

CSV.generate do |csv|
  column_names = %w(日付 曜日 出社時間 退社時間 在社時間)
  csv << column_names
  @attendances.each do |day|
    column_values = [
      l(day.worked_on, format: :short),
      $days_of_the_week[day.worked_on.wday],
      (day.started_at.floor_to(15.minutes).strftime("%H:%M") if day.started_at.present? && day.change_status != "否認" && day.change_status != "なし"),
      (day.finished_at.floor_to(15.minutes).strftime("%H:%M") if day.finished_at.present? && day.change_status != "否認" && day.change_status != "なし"),
      (format("%.2f", working_times(day.started_at.floor_to(15.minutes), day.finished_at.floor_to(15.minutes), day.next_day_of_change)) if
      day.started_at.present? && day.finished_at.present? && day.change_status != "否認" && day.change_status != "なし")
    ]
    csv << column_values
  end
end
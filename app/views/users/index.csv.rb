require 'csv'

CSV.generate do |csv|
  column_names = %w(name Email)
  csv << column_names
  @users.each do |user|
    column_values = [
      user.name,
      user.email
    ]
    csv << column_values
  end
end
# coding: utf-8

User.create!(name: "Admin User",
             email: "sample@email.com",
             employee_number: "1",
             password: "password",
             password_confirmation: "password",
             admin: true)

User.create!(name: "Superior-1 User",
             email: "superior-1@email.com",
             employee_number: "2",
             password: "password",
             password_confirmation: "password",
             superior: true)
             
User.create!(name: "Superior-2 User",
             email: "superior-2@email.com",
             employee_number: "3",
             password: "password",
             password_confirmation: "password",
             superior: true)            

5.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  employee_number = n + 4
  password = "password"
  User.create!(name: name,
              email: email,
              employee_number: employee_number,
              password: password,
              password_confirmation: password)
end

Location.create!(location_name: "本社",location_type: "出勤",user_id:1)

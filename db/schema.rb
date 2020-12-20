# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20201207031433) do

  create_table "attendances", force: :cascade do |t|
    t.date "worked_on"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.string "note"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "working_time"
    t.datetime "change_before_started_at"
    t.datetime "change_before_finished_at"
    t.datetime "overtime"
    t.datetime "end_instruction_time"
    t.string "instructor_confirmation"
    t.text "overtime_instructions"
    t.string "instructor"
    t.string "approval"
    t.string "next_day", default: "0"
    t.integer "overtime_superior_id"
    t.string "overtime_status"
    t.integer "overtime_approval", default: 1
    t.string "overtime_hours"
    t.string "overtime_check", default: "0"
    t.datetime "month_request"
    t.string "month_check", default: "0"
    t.integer "month_approval", default: 1
    t.datetime "changed_started_at"
    t.datetime "changed_finished_at"
    t.string "change_check", default: "0"
    t.string "change_status"
    t.integer "change_superior_id"
    t.integer "change_approval", default: 1
    t.integer "superior_id"
    t.string "status"
    t.string "change_superior_name"
    t.string "overtime_superior_name"
    t.string "superior_name"
    t.date "calendar_day"
    t.datetime "approval_date"
    t.string "reason_change"
    t.string "next_day_of_change", default: "0"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "location_name", default: "本社"
    t.string "location_type"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location_number", default: "未設定"
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.datetime "schedule_finished_at", default: "2020-12-20 10:00:00"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "department"
    t.datetime "basic_time", default: "2020-12-19 23:00:00"
    t.datetime "work_time", default: "2020-12-19 22:30:00"
    t.datetime "basic_work_time", default: "2020-12-19 23:00:00"
    t.datetime "designated_work_start_time", default: "2020-12-20 01:00:00"
    t.datetime "designated_work_end_time", default: "2020-12-20 10:00:00"
    t.boolean "superior", default: false
    t.string "affiliation", default: "未所属"
    t.integer "employee_number"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end

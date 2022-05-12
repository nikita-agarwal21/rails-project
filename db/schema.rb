# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_12_175259) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_code"
    t.string "course_name"
    t.integer "cee_max"
    t.integer "see_max"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "outcomes", force: :cascade do |t|
    t.string "usn"
    t.string "course_code"
    t.integer "cee_obtained"
    t.integer "see_obtained"
    t.bigint "student_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_outcomes_on_course_id"
    t.index ["student_id"], name: "index_outcomes_on_student_id"
  end

  create_table "results", force: :cascade do |t|
    t.string "usn"
    t.string "course_code"
    t.integer "cee_obtained"
    t.integer "see_obtained"
    t.string "references"
    t.string "students"
    t.string "referencescourses"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rewards", force: :cascade do |t|
    t.string "usn"
    t.string "course_code"
    t.integer "cee_obtained"
    t.integer "see_obatined"
    t.bigint "students_id", null: false
    t.bigint "courses_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["courses_id"], name: "index_rewards_on_courses_id"
    t.index ["students_id"], name: "index_rewards_on_students_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "usn"
    t.string "name"
    t.string "gender"
    t.integer "phonenumber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "outcomes", "courses"
  add_foreign_key "outcomes", "students"
  add_foreign_key "rewards", "courses", column: "courses_id"
  add_foreign_key "rewards", "students", column: "students_id"
end

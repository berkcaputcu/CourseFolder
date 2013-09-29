# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20130917002136) do

  create_table "courses", force: true do |t|
    t.string   "instructor"
    t.string   "name",       null: false
    t.string   "school"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enrollments", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "course_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "enrollments", ["course_id"], name: "index_enrollments_on_course_id"
  add_index "enrollments", ["user_id", "course_id"], name: "index_enrollments_on_user_id_and_course_id", unique: true
  add_index "enrollments", ["user_id"], name: "index_enrollments_on_user_id"

  create_table "notes", force: true do |t|
    t.text     "content"
    t.integer  "course_id"
    t.integer  "author_id",      null: false
    t.string   "title",          null: false
    t.string   "description"
    t.integer  "forked_from_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["author_id"], name: "index_notes_on_author_id"
  add_index "notes", ["course_id"], name: "index_notes_on_course_id"
  add_index "notes", ["forked_from_id"], name: "index_notes_on_forked_from_id"

  create_table "notifications", force: true do |t|
    t.integer  "user_id"
    t.boolean  "is_seen"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id"

  create_table "tasks", force: true do |t|
    t.string   "name",        null: false
    t.date     "start_date",  null: false
    t.string   "category"
    t.text     "description"
    t.integer  "course_id",   null: false
    t.integer  "user_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["course_id", "user_id"], name: "index_tasks_on_course_id_and_user_id"
  add_index "tasks", ["course_id"], name: "index_tasks_on_course_id"
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

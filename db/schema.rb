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

ActiveRecord::Schema.define(version: 20150914235925) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "backups", force: :cascade do |t|
    t.integer  "server_id"
    t.integer  "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "backups", ["job_id"], name: "index_backups_on_job_id", using: :btree
  add_index "backups", ["server_id"], name: "index_backups_on_server_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "day_thread"
    t.text     "alteration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "jobs", ["user_id"], name: "index_jobs_on_user_id", using: :btree

  create_table "scales", force: :cascade do |t|
    t.integer  "stay_id"
    t.date     "day_scale"
    t.date     "month_scale"
    t.date     "year_scale"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "scales", ["stay_id"], name: "index_scales_on_stay_id", using: :btree

  create_table "servers", force: :cascade do |t|
    t.string   "name"
    t.string   "ip"
    t.string   "day_week"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_servers", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "server_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "service_servers", ["server_id"], name: "index_service_servers_on_server_id", using: :btree
  add_index "service_servers", ["service_id"], name: "index_service_servers_on_service_id", using: :btree
  add_index "service_servers", ["user_id"], name: "index_service_servers_on_user_id", using: :btree

  create_table "services", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "server_id"
    t.date     "date_service"
    t.text     "obs"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "services", ["server_id"], name: "index_services_on_server_id", using: :btree
  add_index "services", ["user_id"], name: "index_services_on_user_id", using: :btree

  create_table "stays", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "stays", ["user_id"], name: "index_stays_on_user_id", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.integer  "server_id"
    t.boolean  "done"
    t.integer  "work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tasks", ["server_id"], name: "index_tasks_on_server_id", using: :btree
  add_index "tasks", ["work_id"], name: "index_tasks_on_work_id", using: :btree

  create_table "type_users", force: :cascade do |t|
    t.integer  "type"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "type_users", ["user_id"], name: "index_type_users_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "login",               default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["login"], name: "index_users_on_login", unique: true, using: :btree

  create_table "works", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "day_work"
    t.text     "alteration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "works", ["user_id"], name: "index_works_on_user_id", using: :btree

  add_foreign_key "backups", "jobs"
  add_foreign_key "backups", "servers"
  add_foreign_key "jobs", "users"
  add_foreign_key "scales", "stays"
  add_foreign_key "service_servers", "servers"
  add_foreign_key "service_servers", "services"
  add_foreign_key "service_servers", "users"
  add_foreign_key "services", "servers"
  add_foreign_key "services", "users"
  add_foreign_key "stays", "users"
  add_foreign_key "tasks", "servers"
  add_foreign_key "tasks", "works"
  add_foreign_key "type_users", "users"
  add_foreign_key "works", "users"
end

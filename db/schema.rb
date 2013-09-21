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

ActiveRecord::Schema.define(version: 20130920224014) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_products", id: false, force: true do |t|
    t.integer "category_id"
    t.integer "product_id"
  end

  create_table "clientes", force: true do |t|
    t.string   "name"
    t.string   "adress"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.decimal  "price"
    t.boolean  "stock"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.datetime "date_ini"
    t.datetime "date_end"
    t.text     "description"
    t.decimal  "cost_hr"
    t.integer  "cliente_id"
    t.integer  "leader_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects_usuarios", id: false, force: true do |t|
    t.integer "project_id"
    t.integer "usuario_id"
  end

  create_table "task_cats", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "task_comments", force: true do |t|
    t.text     "content"
    t.boolean  "reply"
    t.integer  "task_id"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "task_histories", force: true do |t|
    t.integer  "task_id"
    t.integer  "version"
    t.decimal  "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "task_priorities", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "task_statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.string   "name"
    t.datetime "date_ini"
    t.datetime "date_end"
    t.boolean  "milestone"
    t.decimal  "estimated_time"
    t.text     "description"
    t.decimal  "actual_time"
    t.boolean  "running"
    t.integer  "version"
    t.integer  "project_id"
    t.integer  "task_status_id"
    t.integer  "task_cat_id"
    t.integer  "task_priority_id"
    t.integer  "assignee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams_usuarios", id: false, force: true do |t|
    t.integer "team_id"
    t.integer "usuario_id"
  end

  create_table "usuarios", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name",                   default: ""
    t.string   "last_name",              default: ""
    t.integer  "role",                   default: 0
    t.boolean  "admin",                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

end

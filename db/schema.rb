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

ActiveRecord::Schema[7.0].define(version: 2023_09_12_100407) do
  create_table "administrators", force: :cascade do |t|
    t.integer "admin_user_id", null: false
    t.integer "admin_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_group_id"], name: "index_administrators_on_admin_group_id"
    t.index ["admin_user_id"], name: "index_administrators_on_admin_user_id"
  end

  create_table "admins", force: :cascade do |t|
    t.integer "admin_user_id"
    t.integer "admin_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "administrators_id"
    t.index ["administrators_id"], name: "index_groups_on_administrators_id"
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "groups_users", force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_groups_users_on_group_id"
    t.index ["user_id"], name: "index_groups_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
  end

  add_foreign_key "administrators", "admin_groups"
  add_foreign_key "administrators", "admin_users"
  add_foreign_key "groups", "users"
  add_foreign_key "groups", "users", column: "administrators_id"
  add_foreign_key "groups_users", "groups"
  add_foreign_key "groups_users", "users"
end

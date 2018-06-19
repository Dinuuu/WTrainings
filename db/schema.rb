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

ActiveRecord::Schema.define(version: 20180619040401) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "backoffice_administrators", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_backoffice_administrators_on_email", unique: true
    t.index ["reset_password_token"], name: "index_backoffice_administrators_on_reset_password_token", unique: true
  end

  create_table "invitations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "training_session_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "attended", default: false, null: false
    t.index ["training_session_id"], name: "index_invitations_on_training_session_id"
    t.index ["user_id"], name: "index_invitations_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "training_sessions", force: :cascade do |t|
    t.date "dictation_date"
    t.bigint "training_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "time"
    t.integer "status"
    t.index ["training_id"], name: "index_training_sessions_on_training_id"
    t.index ["user_id"], name: "index_training_sessions_on_user_id"
  end

  create_table "training_users", force: :cascade do |t|
    t.bigint "training_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["training_id"], name: "index_training_users_on_training_id"
    t.index ["user_id"], name: "index_training_users_on_user_id"
  end

  create_table "trainings", force: :cascade do |t|
    t.string "name"
    t.string "feedback_form"
    t.string "program"
    t.string "slides"
    t.text "objective"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "kind"
    t.integer "t_type", default: 0, null: false
    t.float "duration"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "full_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "invitations", "training_sessions"
  add_foreign_key "invitations", "users"
  add_foreign_key "training_sessions", "trainings"
  add_foreign_key "training_sessions", "users"
  add_foreign_key "training_users", "trainings"
  add_foreign_key "training_users", "users"
end

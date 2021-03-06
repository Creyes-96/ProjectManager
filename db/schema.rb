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

ActiveRecord::Schema.define(version: 2021_09_01_010321) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "project_phase_activities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "project_phases_id"
    t.index ["project_phases_id"], name: "index_project_phase_activities_on_project_phases_id"
  end

  create_table "project_phase_milestone_notes", force: :cascade do |t|
    t.string "note"
    t.bigint "project_phase_milestones_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "users_id"
    t.index ["project_phase_milestones_id"], name: "notes_index"
    t.index ["users_id"], name: "index_project_phase_milestone_notes_on_users_id"
  end

  create_table "project_phase_milestones", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "project_phases_id"
    t.index ["project_phases_id"], name: "index_project_phase_milestones_on_project_phases_id"
  end

  create_table "project_phases", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "projects_id"
    t.index ["projects_id"], name: "index_project_phases_on_projects_id"
  end

  create_table "project_teams", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "users_id"
    t.bigint "projects_id"
    t.index ["projects_id"], name: "index_project_teams_on_projects_id"
    t.index ["users_id"], name: "index_project_teams_on_users_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "state"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "users_id"
    t.index ["users_id"], name: "index_projects_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "username", null: false
    t.string "email", default: "", null: false
    t.string "privilege", default: "0", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["first_name"], name: "index_users_on_first_name"
    t.index ["last_name"], name: "index_users_on_last_name"
    t.index ["privilege"], name: "index_users_on_privilege"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "project_phase_activities", "project_phases", column: "project_phases_id"
  add_foreign_key "project_phase_milestone_notes", "project_phase_milestones", column: "project_phase_milestones_id"
  add_foreign_key "project_phase_milestone_notes", "users", column: "users_id"
  add_foreign_key "project_phase_milestones", "project_phases", column: "project_phases_id"
  add_foreign_key "project_phases", "projects", column: "projects_id"
  add_foreign_key "project_teams", "projects", column: "projects_id"
  add_foreign_key "project_teams", "users", column: "users_id"
  add_foreign_key "projects", "users", column: "users_id"
end

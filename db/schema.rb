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

ActiveRecord::Schema[7.0].define(version: 2023_05_01_172113) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "assigned_tasks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "task_id"
    t.bigint "project_id"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_assigned_tasks_on_location_id"
    t.index ["project_id"], name: "index_assigned_tasks_on_project_id"
    t.index ["task_id"], name: "index_assigned_tasks_on_task_id"
    t.index ["user_id"], name: "index_assigned_tasks_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.geography "coords", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}, null: false
    t.float "longitude", null: false
    t.float "latitude", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coords"], name: "index_locations_on_coords", using: :gist
    t.index ["latitude", "longitude"], name: "index_locations_on_latitude_and_longitude"
  end

  create_table "projects", force: :cascade do |t|
    t.text "title"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "project_id"
    t.bigint "location_id"
    t.string "priority", default: "normal", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_tasks_on_location_id"
    t.index ["project_id"], name: "index_tasks_on_project_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

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

ActiveRecord::Schema.define(version: 2021_10_22_180118) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contract_workers", force: :cascade do |t|
    t.string "identifier"
    t.string "description"
    t.string "estimated_hours"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.bigint "organization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_departments_on_organization_id"
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "occupations", force: :cascade do |t|
    t.string "name"
    t.string "salary"
    t.bigint "department_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_occupations_on_department_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "company_name"
    t.string "trading_name"
    t.string "document"
    t.string "address"
    t.string "number"
    t.string "district"
    t.string "complement"
    t.string "cep"
    t.string "city"
    t.string "uf"
    t.string "opening_hours"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "occupation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["occupation_id"], name: "index_roles_on_occupation_id"
  end

  create_table "time_sheets", force: :cascade do |t|
    t.string "status"
    t.bigint "worker_id", null: false
    t.integer "time_worked"
    t.string "comment"
    t.json "datas", default: {}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["worker_id"], name: "index_time_sheets_on_worker_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "worker_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["worker_id"], name: "index_users_on_worker_id"
  end

  create_table "workers", force: :cascade do |t|
    t.string "identifier"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "roles_id", null: false
    t.bigint "department_id"
    t.string "type"
    t.json "config", default: {}
    t.bigint "contract_worker_id"
    t.integer "daily_workload", default: 8
    t.index ["contract_worker_id"], name: "index_workers_on_contract_worker_id"
    t.index ["department_id"], name: "index_workers_on_department_id"
    t.index ["roles_id"], name: "index_workers_on_roles_id"
  end

  add_foreign_key "departments", "organizations"
  add_foreign_key "occupations", "departments"
  add_foreign_key "roles", "occupations"
  add_foreign_key "time_sheets", "workers"
  add_foreign_key "users", "workers"
  add_foreign_key "workers", "contract_workers"
  add_foreign_key "workers", "departments"
  add_foreign_key "workers", "roles", column: "roles_id"
end

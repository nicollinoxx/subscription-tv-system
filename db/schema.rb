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

ActiveRecord::Schema[8.0].define(version: 2025_07_26_203709) do
  create_table "additional_services", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "additional_services_packages", id: false, force: :cascade do |t|
    t.integer "additional_service_id", null: false
    t.integer "package_id", null: false
    t.index ["additional_service_id", "package_id"], name: "idx_on_additional_service_id_package_id_92c01c0079"
    t.index ["package_id", "additional_service_id"], name: "idx_on_package_id_additional_service_id_522bfe430c"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "packages", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "plan_id", null: false
    t.index ["plan_id"], name: "index_packages_on_plan_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "signatures", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "plan_id"
    t.integer "package_id"
    t.index ["customer_id"], name: "index_signatures_on_customer_id"
    t.index ["package_id"], name: "index_signatures_on_package_id"
    t.index ["plan_id"], name: "index_signatures_on_plan_id"
  end

  add_foreign_key "packages", "plans"
  add_foreign_key "signatures", "customers"
  add_foreign_key "signatures", "packages"
  add_foreign_key "signatures", "plans"
end

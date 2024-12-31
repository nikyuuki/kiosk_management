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

ActiveRecord::Schema[7.2].define(version: 2024_12_31_024555) do
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

  create_table "attendant_shifts", force: :cascade do |t|
    t.bigint "kiosk_id", null: false
    t.date "date"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kiosk_id"], name: "index_attendant_shifts_on_kiosk_id"
    t.index ["user_id"], name: "index_attendant_shifts_on_user_id"
  end

  create_table "category_products", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_category_products_on_name", unique: true
  end

  create_table "category_utilities", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_category_utilities_on_name", unique: true
  end

  create_table "combos", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "price", precision: 10, scale: 2
  end

  create_table "kiosks", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_statuses", force: :cascade do |t|
    t.bigint "kiosk_id", null: false
    t.bigint "product_id", null: false
    t.string "status"
    t.integer "quantity"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kiosk_id"], name: "index_product_statuses_on_kiosk_id"
    t.index ["product_id"], name: "index_product_statuses_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "priceperpack", precision: 10, scale: 2
    t.string "code"
  end

  create_table "sales", force: :cascade do |t|
    t.bigint "kiosk_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity"
    t.decimal "total_price"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kiosk_id"], name: "index_sales_on_kiosk_id"
    t.index ["product_id"], name: "index_sales_on_product_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "time_in"
    t.datetime "time_out"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "utilities", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_utility_id"
    t.index ["category_utility_id"], name: "index_utilities_on_category_utility_id"
  end

  create_table "utility_statuses", force: :cascade do |t|
    t.bigint "kiosk_id", null: false
    t.bigint "utility_id", null: false
    t.string "description"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status_opening", default: false
    t.boolean "status_closing", default: false
    t.index ["kiosk_id"], name: "index_utility_statuses_on_kiosk_id"
    t.index ["utility_id"], name: "index_utility_statuses_on_utility_id"
  end

  add_foreign_key "attendant_shifts", "kiosks"
  add_foreign_key "attendant_shifts", "users"
  add_foreign_key "product_statuses", "kiosks"
  add_foreign_key "product_statuses", "products"
  add_foreign_key "sales", "kiosks"
  add_foreign_key "sales", "products"
  add_foreign_key "utilities", "category_utilities"
  add_foreign_key "utility_statuses", "kiosks"
  add_foreign_key "utility_statuses", "utilities"
end

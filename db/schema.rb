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

ActiveRecord::Schema[7.1].define(version: 2025_02_10_090205) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "catagories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "districts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_skus", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_id"
    t.bigint "product_id"
    t.integer "quantity"
    t.decimal "price"
    t.date "delivery_date"
    t.string "size"
    t.index ["order_id"], name: "index_order_skus_on_order_id"
    t.index ["product_id"], name: "index_order_skus_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "retailor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "visit_id"
    t.bigint "user_id", null: false
    t.string "unique_code", null: false
    t.decimal "total_price", precision: 10, scale: 2, null: false
    t.decimal "advance_payment", precision: 10, scale: 2, null: false
    t.string "payment_status", null: false
    t.date "delivery_date"
    t.bigint "remaining_amount"
    t.integer "status", default: 0, null: false
    t.index ["retailor_id"], name: "index_orders_on_retailor_id"
    t.index ["unique_code"], name: "index_orders_on_unique_code", unique: true
    t.index ["user_id"], name: "index_orders_on_user_id"
    t.index ["visit_id"], name: "index_orders_on_visit_id"
  end

  create_table "product_skus", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.integer "quantity"
    t.decimal "price"
    t.string "product_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "size"
    t.bigint "mop"
    t.index ["product_id"], name: "index_product_skus_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "amount"
    t.text "description"
    t.bigint "catagory_id"
    t.index ["catagory_id"], name: "index_products_on_catagory_id"
  end

  create_table "retailor_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "visiting_time"
    t.bigint "district_id"
    t.bigint "zone_id"
    t.bigint "retailor_id"
    t.integer "task_ids", default: [], array: true
    t.index ["district_id"], name: "index_retailor_users_on_district_id"
    t.index ["retailor_id"], name: "index_retailor_users_on_retailor_id"
    t.index ["user_id"], name: "index_retailor_users_on_user_id"
    t.index ["zone_id"], name: "index_retailor_users_on_zone_id"
  end

  create_table "retailor_visits", force: :cascade do |t|
    t.bigint "visit_id", null: false
    t.bigint "retailor_id"
    t.string "status"
    t.string "activity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.datetime "visiting_time"
    t.index ["retailor_id"], name: "index_retailor_visits_on_retailor_id"
    t.index ["user_id"], name: "index_retailor_visits_on_user_id"
    t.index ["visit_id"], name: "index_retailor_visits_on_visit_id"
  end

  create_table "retailors", force: :cascade do |t|
    t.string "shop_name"
    t.string "owner_name"
    t.text "address"
    t.bigint "user_id", null: false
    t.string "mobile_number"
    t.integer "pin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "zone_id"
    t.integer "district_id"
    t.index ["user_id"], name: "index_retailors_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", force: :cascade do |t|
    t.bigint "role_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_roles_users_on_role_id"
    t.index ["user_id"], name: "index_roles_users_on_user_id"
  end

  create_table "skus", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "order_id", null: false
    t.string "product_size"
    t.integer "quantity"
    t.date "delivery_date"
    t.string "payment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_skus_on_order_id"
    t.index ["product_id"], name: "index_skus_on_product_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_details", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.bigint "state_id"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.integer "gender"
    t.date "date_of_birth"
    t.integer "proof_of_id"
    t.string "id_proof_details"
    t.string "building_name"
    t.string "flat_no"
    t.string "road"
    t.string "block_sector"
    t.string "post_office"
    t.string "state"
    t.string "village_or_city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "zone_id"
    t.bigint "district_id"
    t.index ["district_id"], name: "index_user_details_on_district_id"
    t.index ["role_id"], name: "index_user_details_on_role_id"
    t.index ["user_id"], name: "index_user_details_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "otp_secret_key"
    t.integer "user_type"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "sign_in_count"
    t.integer "role", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_zones", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "zone_id", null: false
    t.index ["user_id"], name: "index_users_zones_on_user_id"
    t.index ["zone_id"], name: "index_users_zones_on_zone_id"
  end

  create_table "visits", force: :cascade do |t|
    t.datetime "date_of_time", null: false
    t.string "order_status"
    t.datetime "leave_time"
    t.bigint "user_id", null: false
    t.string "address"
    t.boolean "has_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reason"
    t.string "status"
    t.bigint "visit_token"
    t.bigint "zone_id"
    t.bigint "retailor_id"
    t.index ["retailor_id"], name: "index_visits_on_retailor_id"
    t.index ["user_id"], name: "index_visits_on_user_id"
    t.index ["zone_id"], name: "index_visits_on_zone_id"
  end

  create_table "working_areas", force: :cascade do |t|
    t.string "retailer_name"
    t.string "district"
    t.string "address"
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_working_areas_on_role_id"
    t.index ["user_id"], name: "index_working_areas_on_user_id"
  end

  create_table "zones", force: :cascade do |t|
    t.string "name"
    t.string "unique_code"
    t.bigint "district_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["district_id"], name: "index_zones_on_district_id"
  end

  add_foreign_key "order_skus", "orders"
  add_foreign_key "order_skus", "products"
  add_foreign_key "orders", "retailors"
  add_foreign_key "orders", "users"
  add_foreign_key "orders", "visits"
  add_foreign_key "product_skus", "products"
  add_foreign_key "products", "catagories"
  add_foreign_key "retailor_users", "districts"
  add_foreign_key "retailor_users", "retailors"
  add_foreign_key "retailor_users", "users"
  add_foreign_key "retailor_users", "zones"
  add_foreign_key "retailor_visits", "retailors"
  add_foreign_key "retailor_visits", "users"
  add_foreign_key "retailor_visits", "visits"
  add_foreign_key "retailors", "users"
  add_foreign_key "roles_users", "roles"
  add_foreign_key "roles_users", "users"
  add_foreign_key "skus", "orders"
  add_foreign_key "skus", "products"
  add_foreign_key "user_details", "districts"
  add_foreign_key "user_details", "roles"
  add_foreign_key "user_details", "users"
  add_foreign_key "user_details", "zones"
  add_foreign_key "visits", "retailors"
  add_foreign_key "visits", "users"
  add_foreign_key "visits", "zones"
  add_foreign_key "working_areas", "roles"
  add_foreign_key "working_areas", "users"
  add_foreign_key "zones", "districts"
end

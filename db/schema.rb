# typed: false
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

ActiveRecord::Schema.define(version: 2021_08_10_222707) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.string "remote_id"
    t.decimal "balance", precision: 21, scale: 3
    t.string "currency", limit: 3
    t.string "official_name"
    t.string "account_type"
    t.string "mask"
    t.bigint "institution_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["institution_id"], name: "index_accounts_on_institution_id"
  end

  create_table "institutions", force: :cascade do |t|
    t.string "link_token"
    t.string "access_token"
    t.string "item_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_institutions_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "name"
    t.string "remote_id"
    t.decimal "amount", precision: 21, scale: 3
    t.bigint "account_id", null: false
    t.string "currency", limit: 3
    t.date "occurred_on"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_transactions_on_account_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
  end

  add_foreign_key "accounts", "institutions"
  add_foreign_key "transactions", "accounts"
end

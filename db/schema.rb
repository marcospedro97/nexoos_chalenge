# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_23_223622) do

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.integer "number"
    t.string "complement"
    t.integer "applicant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "zip_code"
    t.index ["applicant_id"], name: "index_addresses_on_applicant_id"
  end

  create_table "applicants", force: :cascade do |t|
    t.string "social_name"
    t.string "cnpj"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_applicants_on_user_id"
  end

  create_table "credit_solicitations", force: :cascade do |t|
    t.integer "applicant_id", null: false
    t.decimal "value"
    t.integer "plots_amount"
    t.float "interest_rate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "plots_value"
    t.decimal "value_with_rate"
    t.index ["applicant_id"], name: "index_credit_solicitations_on_applicant_id"
  end

  create_table "phones", force: :cascade do |t|
    t.string "number"
    t.integer "applicant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["applicant_id"], name: "index_phones_on_applicant_id"
  end

  create_table "plots", force: :cascade do |t|
    t.integer "credit_solicitation_id", null: false
    t.date "payment_day"
    t.decimal "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["credit_solicitation_id"], name: "index_plots_on_credit_solicitation_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "applicants"
  add_foreign_key "applicants", "users"
  add_foreign_key "credit_solicitations", "applicants"
  add_foreign_key "phones", "applicants"
  add_foreign_key "plots", "credit_solicitations"
end

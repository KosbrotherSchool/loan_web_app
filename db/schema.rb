# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141012122940) do

  create_table "accesses", force: true do |t|
    t.string   "address"
    t.string   "layer"
    t.string   "building_type"
    t.integer  "rooms"
    t.integer  "living_rooms"
    t.integer  "rest_rooms"
    t.decimal  "building_area",              precision: 10, scale: 2
    t.integer  "building_age"
    t.string   "parking_type"
    t.decimal  "parking_area",               precision: 10, scale: 0
    t.string   "applicant_name"
    t.string   "applicant_email"
    t.string   "applicant_line_id_or_phone"
    t.text     "other_info"
    t.integer  "county_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bank_products", force: true do |t|
    t.integer  "bank_id"
    t.string   "title"
    t.text     "interest"
    t.string   "binding"
    t.string   "break_money"
    t.string   "grace_year"
    t.string   "portion"
    t.text     "other_info"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "banks", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icon_link"
  end

  create_table "case_statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "counties", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "credit_cases", force: true do |t|
    t.integer  "loan_money"
    t.integer  "to_loan_period_years"
    t.string   "applicant_name"
    t.string   "applicant_email"
    t.string   "applicant_phone"
    t.string   "applicant_line_id"
    t.integer  "applicant_age"
    t.boolean  "is_married"
    t.string   "education"
    t.string   "applicant_company_name"
    t.string   "applicant_title"
    t.integer  "applicant_serve_year"
    t.integer  "applicant_year_earning"
    t.boolean  "applicant_is_have_house"
    t.string   "applicant_other_house_loan"
    t.string   "applicant_other_credit_loan"
    t.boolean  "is_pay_late_in_half_year"
    t.string   "credit_card_years"
    t.text     "other_info"
    t.boolean  "is_lender_contact"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "notes"
    t.integer  "status_id"
  end

  create_table "lender_county_ships", force: true do |t|
    t.integer  "lender_id"
    t.integer  "county_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lender_loan_case_ships", force: true do |t|
    t.integer  "lender_id"
    t.integer  "loan_case_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_responded"
    t.integer  "view_nums",        default: 0
    t.integer  "loan_response_id"
  end

  create_table "lender_onlending_ships", force: true do |t|
    t.integer  "lender_id"
    t.integer  "onlending_id"
    t.boolean  "is_responded"
    t.integer  "view_nums"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lenders", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "contact_company_phone"
    t.string   "fax_phone"
    t.string   "contact_personal_phone"
    t.string   "bank"
    t.string   "bank_branch"
    t.string   "work_title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "card_file_name"
    t.string   "card_content_type"
    t.integer  "card_file_size"
    t.datetime "card_updated_at"
    t.boolean  "is_male"
    t.boolean  "is_phone_confirmed"
    t.boolean  "is_mail_confirmed"
    t.boolean  "is_person_confirmed"
    t.boolean  "is_show"
    t.integer  "user_lender_id"
    t.string   "line_id"
  end

  create_table "loan_cases", force: true do |t|
    t.boolean  "is_dealed"
    t.integer  "to_buy_price"
    t.integer  "parking_price"
    t.integer  "to_loan_price"
    t.boolean  "is_need_grace_period"
    t.integer  "grace_period_years"
    t.integer  "to_loan_period_years"
    t.text     "other_info"
    t.string   "address"
    t.string   "layer"
    t.string   "building_type"
    t.integer  "rooms"
    t.integer  "living_rooms"
    t.integer  "rest_rooms"
    t.decimal  "building_area",               precision: 10, scale: 2
    t.integer  "building_age"
    t.string   "house_decoration"
    t.string   "house_condition"
    t.boolean  "is_top_built"
    t.decimal  "top_building_area",           precision: 10, scale: 2
    t.string   "parking_type"
    t.decimal  "parking_area",                precision: 10, scale: 0
    t.string   "applicant_name"
    t.string   "applicant_email"
    t.string   "applicant_phone"
    t.integer  "applicant_age"
    t.string   "applicant_company_name"
    t.string   "applicant_title"
    t.integer  "applicant_serve_year"
    t.integer  "applicant_year_earning"
    t.integer  "applicant_other_earning"
    t.boolean  "applicant_is_have_house"
    t.string   "applicant_other_house_loan"
    t.string   "applicant_other_credit_loan"
    t.boolean  "is_credit_ok"
    t.integer  "county_id"
    t.integer  "status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "notes"
    t.datetime "deliver_time"
    t.boolean  "is_charged"
    t.boolean  "is_feedbacked"
    t.boolean  "is_mailed_lenders"
    t.text     "advise",                                                               null: false
    t.datetime "dead_time"
    t.boolean  "is_lender_contact",                                    default: false
    t.string   "line_id"
  end

  create_table "loan_responses", force: true do |t|
    t.integer  "loan_money"
    t.integer  "loan_years"
    t.string   "loan_interest"
    t.text     "interest_explaination"
    t.boolean  "is_binded"
    t.string   "grace_period"
    t.text     "expense_explaination"
    t.text     "other_info"
    t.integer  "lender_id"
    t.integer  "loan_case_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "onlending_responses", force: true do |t|
    t.integer  "more_loan_money"
    t.integer  "loan_years"
    t.string   "loan_interest"
    t.text     "interest_explaination"
    t.boolean  "is_binded"
    t.string   "grace_period"
    t.text     "expense_explaination"
    t.text     "other_info"
    t.integer  "lender_id"
    t.integer  "onlending_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "onlendings", force: true do |t|
    t.string   "current_bank"
    t.integer  "current_loan_price"
    t.integer  "more_loan_price"
    t.boolean  "is_need_grace_period"
    t.integer  "grace_period_years"
    t.integer  "to_loan_period_years"
    t.text     "other_info"
    t.string   "address"
    t.string   "layer"
    t.string   "building_type"
    t.integer  "rooms"
    t.integer  "living_rooms"
    t.integer  "rest_rooms"
    t.decimal  "building_area",               precision: 10, scale: 2
    t.integer  "building_age"
    t.string   "house_decoration"
    t.string   "house_condition"
    t.boolean  "is_top_built"
    t.decimal  "top_building_area",           precision: 10, scale: 2
    t.string   "parking_type"
    t.decimal  "parking_area",                precision: 10, scale: 0
    t.string   "applicant_name"
    t.string   "applicant_email"
    t.string   "applicant_phone"
    t.integer  "applicant_age"
    t.string   "applicant_company_name"
    t.string   "applicant_title"
    t.integer  "applicant_serve_year"
    t.integer  "applicant_year_earning"
    t.integer  "applicant_other_earning"
    t.boolean  "applicant_is_have_house"
    t.string   "applicant_other_house_loan"
    t.string   "applicant_other_credit_loan"
    t.boolean  "is_credit_ok"
    t.string   "notes"
    t.datetime "deliver_time"
    t.boolean  "is_charged"
    t.boolean  "is_feedbacked"
    t.boolean  "is_mailed_lenders"
    t.integer  "county_id"
    t.integer  "status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "advise",                                               null: false
    t.datetime "dead_time"
    t.boolean  "is_lender_contact"
  end

  create_table "qas", force: true do |t|
    t.integer  "type_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recent_news", force: true do |t|
    t.string   "date_string"
    t.string   "title"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recent_posts", force: true do |t|
    t.string   "date_string"
    t.string   "title"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "simple_cases", force: true do |t|
    t.string   "name"
    t.string   "line_id"
    t.integer  "age"
    t.integer  "loan_money"
    t.string   "usage"
    t.boolean  "is_in_debt"
    t.boolean  "is_using_card"
    t.text     "other_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_lenders", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_lenders", ["email"], name: "index_user_lenders_on_email", unique: true, using: :btree
  add_index "user_lenders", ["reset_password_token"], name: "index_user_lenders_on_reset_password_token", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

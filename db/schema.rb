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

ActiveRecord::Schema.define(version: 20140621030126) do

  create_table "counties", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lender_responses", force: true do |t|
    t.integer  "loan_money"
    t.integer  "loan_years"
    t.string   "loan_interest"
    t.text     "interest_explaination"
    t.boolean  "is_binded"
    t.text     "expense_explaination"
    t.text     "other_info"
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
    t.decimal  "building_area",                       precision: 10, scale: 2
    t.decimal  "public_area",                         precision: 10, scale: 2
    t.decimal  "land_area",                           precision: 10, scale: 2
    t.integer  "building_age"
    t.string   "house_decoration"
    t.string   "house_condition"
    t.boolean  "is_top_built"
    t.decimal  "top_building_area",                   precision: 10, scale: 2
    t.string   "parking_type"
    t.string   "parking_layer"
    t.decimal  "parking_area",                        precision: 10, scale: 0
    t.string   "applicant_name"
    t.string   "applicant_email"
    t.string   "applicant_phone1"
    t.string   "applicant_phone2"
    t.integer  "applicant_age"
    t.string   "applicant_company_name"
    t.boolean  "is_applicant_company_founder"
    t.string   "applicant_title"
    t.integer  "applicant_serve_year"
    t.integer  "applicant_year_earning"
    t.integer  "applicant_other_earning"
    t.string   "applicant_company_type"
    t.boolean  "applicant_is_have_house"
    t.string   "applicant_other_house_loan"
    t.string   "applicant_other_credit_loan"
    t.string   "applicant_other_car_loan"
    t.string   "applicant_other_learning_loan"
    t.boolean  "is_applicant_use_revolving_interest"
    t.boolean  "is_applicant_use_check"
    t.boolean  "is_applicant_have_bounce_check"
    t.integer  "county_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

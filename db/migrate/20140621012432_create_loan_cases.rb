class CreateLoanCases < ActiveRecord::Migration
  def change
    create_table :loan_cases do |t|
      t.boolean :is_dealed
      t.integer :to_buy_price
      t.integer :parking_price
      t.integer :to_loan_price
      t.boolean :is_need_grace_period
      t.integer :grace_period_years
      t.integer :to_loan_period_years
      t.text :other_info

      t.string :address
      t.string :layer
      t.string :building_type
      t.integer :rooms
      t.integer :living_rooms
      t.integer :rest_rooms
      t.decimal :building_area, :precision => 10, :scale => 2
      t.decimal :public_area, :precision => 10, :scale => 2
      t.decimal :land_area, :precision => 10, :scale => 2
      t.integer :building_age
      t.string :house_decoration
      t.string :house_condition
      t.boolean :is_top_built
      t.decimal :top_building_area, :precision => 10, :scale => 2
      t.string :parking_type
      t.string :parking_layer
      t.decimal :parking_area

      t.string :applicant_name
      t.string :applicant_email
      t.string :applicant_phone1
      t.string :applicant_phone2
      t.integer :applicant_age
      t.string :applicant_company_name
      t.boolean :is_applicant_company_founder
      t.string :applicant_title
      t.integer :applicant_serve_year
      t.integer :applicant_year_earning
      t.integer :applicant_other_earning
      t.string :applicant_company_type
      t.boolean :applicant_is_have_house
      t.string :applicant_other_house_loan
      t.string :applicant_other_credit_loan
      t.string :applicant_other_car_loan
      t.string :applicant_other_learning_loan
      t.boolean :is_applicant_use_revolving_interest
      t.boolean :is_applicant_use_check
      t.boolean :is_applicant_have_bounce_check

      t.integer :county_id
      # t.integer :town_id

      t.timestamps
    end
  end
end

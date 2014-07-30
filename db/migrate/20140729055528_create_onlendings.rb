class CreateOnlendings < ActiveRecord::Migration
  def change
    create_table :onlendings do |t|
      t.string :current_bank
      t.integer :current_loan_price
      t.integer :more_loan_price
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
      t.integer :building_age
      t.string :house_decoration
      t.string :house_condition
      t.boolean :is_top_built
      t.decimal :top_building_area, :precision => 10, :scale => 2
      t.string :parking_type
      t.decimal :parking_area

      t.string :applicant_name
      t.string :applicant_email
      t.string :applicant_phone
      t.integer :applicant_age
      t.string :applicant_company_name
      t.string :applicant_title
      t.integer :applicant_serve_year
      t.integer :applicant_year_earning
      t.integer :applicant_other_earning
      t.boolean :applicant_is_have_house
      t.string :applicant_other_house_loan
      t.string :applicant_other_credit_loan
      t.boolean :is_credit_ok

      t.string   :notes
      t.datetime :deliver_time
      t.integer  :lender_id
      t.boolean  :is_charged
      t.boolean  :is_feedbacked
      t.boolean  :is_mailed_lenders

      t.integer :county_id
      t.integer :status_id
      
      t.timestamps
    end

    execute "ALTER TABLE onlendings AUTO_INCREMENT = 666"
  end
end

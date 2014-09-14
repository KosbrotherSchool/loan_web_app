class CreateCreditCases < ActiveRecord::Migration
  def change
    create_table :credit_cases do |t|
      t.integer :loan_money
      t.integer :to_loan_period_years

      t.string :applicant_name
      t.string :applicant_email
      t.string :applicant_phone
      t.string :applicant_line_id

      t.integer :applicant_age
      t.boolean :is_married
      t.string :education
      t.string :applicant_company_name
      t.string :applicant_title
      t.integer :applicant_serve_year
      t.integer :applicant_year_earning
      t.boolean :applicant_is_have_house
      t.string :applicant_other_house_loan
      t.string :applicant_other_credit_loan
      t.boolean :is_pay_late_in_half_year
      t.string :credit_card_years

      t.text :other_info
      t.boolean :is_lender_contact

      t.timestamps
    end
  end
end

class CreateLoanResponses < ActiveRecord::Migration
  def change
    create_table :loan_responses do |t|
    	t.integer :loan_money
      t.integer :loan_years
      t.string :loan_interest, :precision => 10, :scale => 2
      t.text :interest_explaination
      t.boolean :is_binded
      t.string :grace_period
      t.text :expense_explaination
      t.text :other_info

      t.integer :lender_id
      t.integer :loan_case_id
      t.timestamps
    end
  end
end

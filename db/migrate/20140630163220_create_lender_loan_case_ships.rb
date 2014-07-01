class CreateLenderLoanCaseShips < ActiveRecord::Migration
  def change
    create_table :lender_loan_case_ships do |t|
      t.integer :lender_id
      t.integer :loan_case_id

      t.timestamps
    end
  end
end

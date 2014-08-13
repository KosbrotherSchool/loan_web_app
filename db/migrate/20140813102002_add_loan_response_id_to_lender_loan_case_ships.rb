class AddLoanResponseIdToLenderLoanCaseShips < ActiveRecord::Migration
  def change
    add_column :lender_loan_case_ships, :loan_response_id, :integer
  end
end

class AddIsRospondedToLenderLoanCaseShips < ActiveRecord::Migration
  def change
    add_column :lender_loan_case_ships, :is_responded, :boolean
  end
end

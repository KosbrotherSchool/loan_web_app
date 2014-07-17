class AddViewNumsToLenderLoanCaseShips < ActiveRecord::Migration
  def change
    add_column :lender_loan_case_ships, :view_nums, :integer, :default => 0
  end
end

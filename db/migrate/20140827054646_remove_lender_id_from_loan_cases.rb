class RemoveLenderIdFromLoanCases < ActiveRecord::Migration
  def change
    remove_column :loan_cases, :lender_id, :integer
  end
end

class AddLenderIdToLoanCases < ActiveRecord::Migration
  def change
    add_column :loan_cases, :lender_id, :integer
  end
end

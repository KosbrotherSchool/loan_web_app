class AddIsMailedLendersToLoanCases < ActiveRecord::Migration
  def change
    add_column :loan_cases, :is_mailed_lenders, :boolean
  end
end

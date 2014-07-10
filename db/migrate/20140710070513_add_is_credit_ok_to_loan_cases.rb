class AddIsCreditOkToLoanCases < ActiveRecord::Migration
  def change
    add_column :loan_cases, :is_credit_ok, :boolean
  end
end

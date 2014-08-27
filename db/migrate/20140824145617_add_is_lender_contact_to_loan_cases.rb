class AddIsLenderContactToLoanCases < ActiveRecord::Migration
  def change
    add_column :loan_cases, :is_lender_contact, :boolean, :default => false
  end
end

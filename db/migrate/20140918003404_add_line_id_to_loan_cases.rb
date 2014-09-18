class AddLineIdToLoanCases < ActiveRecord::Migration
  def change
    add_column :loan_cases, :line_id, :string
  end
end

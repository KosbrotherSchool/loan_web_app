class AddNotesToLoanCases < ActiveRecord::Migration
  def change
    add_column :loan_cases, :notes, :string
  end
end

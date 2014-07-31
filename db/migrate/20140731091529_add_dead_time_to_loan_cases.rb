class AddDeadTimeToLoanCases < ActiveRecord::Migration
  def change
    add_column :loan_cases, :dead_time, :datetime
  end
end

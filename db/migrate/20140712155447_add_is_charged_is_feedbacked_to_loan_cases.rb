class AddIsChargedIsFeedbackedToLoanCases < ActiveRecord::Migration
  def change
    add_column :loan_cases, :is_charged, :boolean
    add_column :loan_cases, :is_feedbacked, :boolean
  end
end

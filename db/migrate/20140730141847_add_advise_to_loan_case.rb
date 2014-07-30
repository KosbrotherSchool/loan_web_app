class AddAdviseToLoanCase < ActiveRecord::Migration
  def change
    add_column :loan_cases, :advise, :text, null: false
  end
end

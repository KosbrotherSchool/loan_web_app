class AddDeliverTimeToLoanCase < ActiveRecord::Migration
  def change
    add_column :loan_cases, :deliver_time, :datetime
  end
end

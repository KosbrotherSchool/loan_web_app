class AddUserLenderIdToLenders < ActiveRecord::Migration
  def change
    add_column :lenders, :user_lender_id, :integer
  end
end

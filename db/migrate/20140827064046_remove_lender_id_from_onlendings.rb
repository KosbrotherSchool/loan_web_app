class RemoveLenderIdFromOnlendings < ActiveRecord::Migration
  def change
    remove_column :onlendings, :lender_id, :integer
  end
end

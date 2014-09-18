class AddLineIdToLenders < ActiveRecord::Migration
  def change
    add_column :lenders, :line_id, :string
  end
end

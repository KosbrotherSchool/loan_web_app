class AddIsShowToLenders < ActiveRecord::Migration
  def change
    add_column :lenders, :is_show, :boolean
  end
end

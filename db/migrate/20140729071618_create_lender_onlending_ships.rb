class CreateLenderOnlendingShips < ActiveRecord::Migration
  def change
    create_table :lender_onlending_ships do |t|
      t.integer :lender_id
      t.integer :onlending_id
      t.boolean :is_responded
      t.integer :view_nums

      t.timestamps
    end
  end
end

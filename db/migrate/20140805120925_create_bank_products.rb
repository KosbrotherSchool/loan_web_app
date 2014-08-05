class CreateBankProducts < ActiveRecord::Migration
  def change
    create_table :bank_products do |t|
      t.integer :bank_id
      t.string :title
      t.text :interest
      t.string :binding
      t.string :break_money
      t.string :grace_year
      t.string :portion
      t.text :other_info
      t.string :link

      t.timestamps
    end
  end
end

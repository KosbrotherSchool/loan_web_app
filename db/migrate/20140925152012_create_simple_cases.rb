class CreateSimpleCases < ActiveRecord::Migration
  def change
    create_table :simple_cases do |t|
      t.string :name
      t.string :line_id
      t.integer :age
      t.integer :loan_money
      t.string :usage
      t.boolean :is_in_debt
      t.boolean :is_using_card
      t.text :other_info

      t.timestamps
    end
  end
end

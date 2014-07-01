class CreateLenderCountyShips < ActiveRecord::Migration
  def change
    create_table :lender_county_ships do |t|
      t.integer :lender_id
      t.integer :county_id

      t.timestamps
    end
  end
end

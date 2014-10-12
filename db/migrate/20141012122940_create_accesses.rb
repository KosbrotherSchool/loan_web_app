class CreateAccesses < ActiveRecord::Migration
  def change
    create_table :accesses do |t|
      t.string :address
      t.string :layer
      t.string :building_type
      t.integer :rooms
      t.integer :living_rooms
      t.integer :rest_rooms
      t.decimal :building_area, :precision => 10, :scale => 2
      t.integer :building_age
      t.string :parking_type
      t.decimal :parking_area

      t.string :applicant_name
      t.string :applicant_email
      t.string :applicant_line_id_or_phone
      t.text   :other_info

      t.integer :county_id


      t.timestamps
    end
  end
end

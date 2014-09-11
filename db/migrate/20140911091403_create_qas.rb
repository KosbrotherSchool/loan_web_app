class CreateQas < ActiveRecord::Migration
  def change
    create_table :qas do |t|
      t.integer :type_id
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end

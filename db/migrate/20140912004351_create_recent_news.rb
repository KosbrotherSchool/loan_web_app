class CreateRecentNews < ActiveRecord::Migration
  def change
    create_table :recent_news do |t|
      t.string :date_string
      t.string :title
      t.string :link

      t.timestamps
    end
  end
end

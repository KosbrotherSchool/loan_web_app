class AddDeadTimeToOnlendings < ActiveRecord::Migration
  def change
    add_column :onlendings, :dead_time, :datetime
  end
end

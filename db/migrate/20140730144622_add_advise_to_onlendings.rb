class AddAdviseToOnlendings < ActiveRecord::Migration
  def change
    add_column :onlendings, :advise, :text, null: false
  end
end

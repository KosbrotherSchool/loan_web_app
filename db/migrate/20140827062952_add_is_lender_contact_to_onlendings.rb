class AddIsLenderContactToOnlendings < ActiveRecord::Migration
  def change
    add_column :onlendings, :is_lender_contact, :boolean
  end
end

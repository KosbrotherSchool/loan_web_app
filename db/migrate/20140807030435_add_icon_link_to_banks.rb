class AddIconLinkToBanks < ActiveRecord::Migration
  def change
    add_column :banks, :icon_link, :string
  end
end

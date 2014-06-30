class AddCardToLender < ActiveRecord::Migration
  def self.up
    add_attachment :lenders, :card
  end

  def self.down
    remove_attachment :lenders, :card
  end
end

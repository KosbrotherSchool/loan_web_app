class AddAvatarToLender < ActiveRecord::Migration
  def self.up
    add_attachment :lenders, :avatar
  end

  def self.down
    remove_attachment :lenders, :avatar
  end
end

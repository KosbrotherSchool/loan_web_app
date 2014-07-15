class AddGenderAndStatusToLenders < ActiveRecord::Migration
  def change
    add_column :lenders, :is_male, :boolean
    add_column :lenders, :is_phone_confirmed, :boolean
    add_column :lenders, :is_mail_confirmed, :boolean
    add_column :lenders, :is_person_confirmed, :boolean
  end
end

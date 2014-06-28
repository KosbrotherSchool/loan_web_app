class CreateLenders < ActiveRecord::Migration
  def change
    create_table :lenders do |t|
      t.string :name
      t.string :email
      t.string :contact_company_phone
      t.string :fax_phone
      t.string :contact_personal_phone
      t.string :bank
      t.string :bank_branch
      t.string :work_title

      t.timestamps
    end
  end
end

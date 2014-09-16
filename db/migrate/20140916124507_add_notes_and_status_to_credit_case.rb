class AddNotesAndStatusToCreditCase < ActiveRecord::Migration
  def change
    add_column :credit_cases, :notes, :string
    add_column :credit_cases, :status_id, :integer
  end
end

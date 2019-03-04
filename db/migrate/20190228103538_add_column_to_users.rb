class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :verify_sms, :string, null: false
    add_index :users, :verify_sms, unique: true
  end
end

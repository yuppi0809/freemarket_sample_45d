class ChangeColumnTypeInProfiles < ActiveRecord::Migration[5.0]
  def change
    change_column :profiles, :postal_code, :string, null: false
  end
end

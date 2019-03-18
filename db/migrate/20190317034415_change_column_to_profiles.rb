class ChangeColumnToProfiles < ActiveRecord::Migration[5.0]
    def up
    add_column :profiles, :prefecture_id, :integer, null: false
    remove_column :profiles, :prefecture, :integer
  end

  def down
    add_column :profiles, :prefecture, :integer
    remove_column :profiles, :prefecture_id, :integer, null: false
  end
end

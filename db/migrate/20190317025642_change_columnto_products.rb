class ChangeColumntoProducts < ActiveRecord::Migration[5.0]
  def up
    add_column :products, :prefecture_id, :integer, null: false
    remove_column :products, :local, :integer
  end

  def down
    add_column :products, :local, :integer
    remove_column :products, :prefecture_id, :integer, null: false
  end
end

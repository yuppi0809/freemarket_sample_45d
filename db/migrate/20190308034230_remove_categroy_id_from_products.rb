class RemoveCategroyIdFromProducts < ActiveRecord::Migration[5.0]
  def up
    remove_column :products, :category_id, :integer
  end

  def down
    add_column :products, :category_id, :integer
  end
end

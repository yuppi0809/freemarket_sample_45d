class AddDefaultOptionToProducts < ActiveRecord::Migration[5.0]
  def change
    change_column_default :products, :likes_count, 0
  end
end

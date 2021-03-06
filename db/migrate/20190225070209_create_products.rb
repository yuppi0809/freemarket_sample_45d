class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string       :name, null: false, index: true
      t.text         :description, null: false
      t.integer      :price, null: false
      t.integer      :likes_count
      t.integer      :size
      t.integer      :product_status, null: false
      t.integer      :transaction_status, null: false
      t.integer      :delivery_fee, null: false
      t.integer      :local, null: false
      t.integer      :lead_time, null: false
      t.string       :brand
      t.references   :user, foreign_key: true
      t.integer      :first_category_id
      t.integer      :second_category_id
      t.integer      :third_category_id
      t.integer      :brand_id
      t.timestamps
    end
  end
end

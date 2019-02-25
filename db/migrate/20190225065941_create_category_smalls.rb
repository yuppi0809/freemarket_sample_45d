class CreateCategorySmalls < ActiveRecord::Migration[5.0]
  def change
    create_table :category_smalls do |t|
      t.string     :name, null: false
      t.references :category_middle, foreign_key: true
      t.timestamps
    end
  end
end

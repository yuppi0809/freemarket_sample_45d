class CreateCategoryMiddles < ActiveRecord::Migration[5.0]
  def change
    create_table :category_middles do |t|
      t.string      :name
      t.references :category_large, foreign_key: true
      t.timestamps
    end
  end
end

class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.text       :profile,                null: false
      t.integer    :prefecture,          null: false
      t.string     :city,                 null: false
      t.string     :address,              null: false
      t.integer    :postal_code,         null: false
      t.string     :building_name
      t.integer    :telephone_num
      t.string     :delv_first_name,      null: false
      t.string     :delv_last_name,       null: false
      t.string     :delv_first_name_kana, null: false
      t.string     :delv_last_name_kana,  null: false
      t.references :user,                 foreign_key: true, null: false
      t.timestamps
    end
  end
end

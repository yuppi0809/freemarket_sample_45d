class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.string     :card_num,         index: { unique: true }, null: false
      t.integer    :expiration_month, null: false
      t.integer    :expiration_year,  null: false
      t.integer    :security_code,    null: false
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end

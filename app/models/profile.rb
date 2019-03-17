class Profile < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true

  with_options presence: true do
    validates :delv_first_name
    validates :delv_last_name
    validates :delv_first_name_kana
    validates :delv_last_name_kana
    validates :postal_code, length: { is: 8 }
    validates :prefecture_id
    validates :city
    validates :address
  end
end

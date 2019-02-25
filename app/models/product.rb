class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category_large
  belongs_to :category_middle
  belongs_to :category_small
  enum delivery_fee:{"送料込み（出品者負担）": 0, "着払い": 1}
end

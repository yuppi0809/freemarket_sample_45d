class CategoryLarge < ApplicationRecord
  has_many :products
  has_many :category_middles
end

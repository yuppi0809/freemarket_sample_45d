class CategoryMiddle < ApplicationRecord
  belongs_to :category_large
  has_many :products
  has_many :category_small
end

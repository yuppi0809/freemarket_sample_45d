class CategorySmall < ApplicationRecord
  belongs_to :category_middle
  has_many :products
end

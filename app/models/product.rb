class Product < ApplicationRecord
  belongs_to :category_large
  belongs_to :category_middle
  belongs_to :category_small
end

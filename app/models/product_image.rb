class ProductImage < ApplicationRecord
  belongs_to :product, optional: true
  validates :image, presence: true
  mount_uploader :image, ImageUploader
end

class ProductImage < ApplicationRecord
  belongs_to :product, optional: true
  validates :image, presence: true
  mount_uploaders :image, ImageUploader
end

class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :first_category, class_name: 'Category', foreign_key: "first_category_id"
  belongs_to :second_category, class_name: 'Category', foreign_key: 'second_category_id'
  belongs_to :third_category, class_name: 'Category', foreign_key: 'third_category_id'
  belongs_to :brand, foreign_key: 'brand_id', optional: true
  has_many :product_images, dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :product_images
  has_many :likes, dependent: :destroy

  # enum
  enum delivery_fee: { include: 0, exclude: 1}
  enum product_status: { brand_new: 0, like_new: 1, little_scratch: 2, not_noticeable_scratch: 3, noticeable_scratch: 4, bad: 5}
  enum size: { S: 0, M: 1, L: 2}
  enum lead_time: { one_to_two: 0, two_to_three: 1, four_to_seven: 2}
  enum transaction_status: { listing: 0, in_progress: 1, sold: 2 }

  validates :name, presence: true, length: {maximum: 40}
  validates :description, presence: true, length: {maximum: 1000}
  # validates :size, presence: true
  validates :product_status, presence: true
  validates :delivery_fee, presence: true
  validates :prefecture_id, presence: true
  validates :lead_time, presence: true
  validates :price, presence: true
  validates :transaction_status, presence: true

  def checkPrevItem
    Product.where('id < ?', id).present?
  end

  def showPrevItem
    Product.where('id < ?', id).last
  end

  def checkNextItem
    Product.where('id > ?', id).present?
  end

  def showNextItem
    Product.where('id > ?', id).first
  end

  def show_image_or_no_image
    self.product_images.present? ? self.product_images.first.image : "noimage.png"
  end

  def check_if_user_liked(user_id)
   likes.find_by(user_id: user_id)
  end
end

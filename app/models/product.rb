class Product < ApplicationRecord
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
  enum local: [
    :北海道, :青森県, :岩手県, :宮城県, :秋田県, :山形県,
    :福島県, :茨城県, :栃木県, :群馬県, :埼玉県, :千葉県,
    :東京都, :神奈川県, :新潟県, :富山県, :石川県, :福井県,
    :山梨県, :長野県, :岐阜県, :静岡県, :愛知県, :三重県,
    :滋賀県, :京都府, :大阪府, :兵庫県, :奈良県, :和歌山県,
    :鳥取県, :島根県, :岡山県, :広島県, :山口県, :徳島県,
    :香川県, :愛媛県, :高知県, :福岡県, :佐賀県, :長崎県,
    :熊本県, :大分県, :宮崎県, :鹿児島県, :沖縄県, :未定
  ]
  enum product_status: { brand_new: 0, like_new: 1, little_scratch: 2, not_noticeable_scratch: 3, noticeable_scratch: 4, bad: 5}
  enum size: { S: 0, M: 1, L: 2}
  enum lead_time: { one_to_two: 0, two_to_three: 1, four_to_seven: 2}
  enum transaction_status: { listing: 0, in_progress: 1, sold: 2 }

  validates :name, presence: true, length: {maximum: 40}
  validates :description, presence: true, length: {maximum: 1000}
  # validates :size, presence: true
  validates :product_status, presence: true
  validates :delivery_fee, presence: true
  validates :local, presence: true
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

class Product < ActiveRecord::Base
  belongs_to :category, optional: true
  has_many :product_images
  accepts_nested_attributes_for :product_images

  # enum
  enum delivery_fee:{"送料込み（出品者負担）": 0, "着払い": 1}
  enum local:{"北海道": 0, "青森": 1, "岩手": 2, "山形": 3 }
  enum product_status:{"新品、未使用": 0, "未使用に近い": 1, "目立った傷、汚れなし": 2, "やや傷汚れあり": 3, "傷や汚れあり": 4, "全体に状態が悪い": 5}
  enum size:{"S": 0, "M": 1, "L": 2}
  enum lead_time:{"1~2日で発送": 0, "2~3日で発送": 1, "4~7日で発送": 2}
  enum transaction_status:{"出品中": 0, "交渉中": 1, "出品停止": 2}

  validates :name, presence: true, length: {maximum: 40}
  validates :description, presence: true, length: {maximum: 1000}
  validates  :size, presence: true
  validates :product_status, presence: true
  validates :delivery_fee, presence: true
  validates :local, presence: true
  validates :lead_time, presence: true
  validates :price, presence: true
  validates :transaction_status, presence: true
  validates :category_id, presence: true
end

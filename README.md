# DB design

## Users table

|Column|Type|Options|
|------|----|-------|
|nickname|string|unique: true, null: false|
|email|string|unique: true, null: false|
|password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|verify_sms|string|null: false, unique: true|

### Association
- has_many :products
- has_many :likes
- has_one :profile
- has_many :payments

## Profiles table

|Column|Type|Options|
|------|----|-------|
|profile|text||
|prefecture|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|postal_code|string|null: false|
|building_name|string||
|telephone_num|string||
|delv_first_name|string|null: false|
|delv_last_name|string|null: false|
|delv_first_name_kana|string|null: false|
|delv_last_name_kana|string|null: false|
|user_id|references|foreign_key: true, null: false|

## Association
- belongs_to :user, optional: true

## Products table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|description|text|null: false|
|price|integer|null: false|
|likes_count|integer||
|size|integer||
|product_status|integer|null: false|
|transaction_status|integer|null: false|
|delivery_fee|integer|null: false|
|local|integer|null: false|
|lead_time|integer|null: false|
|bland_id|references|foreign_key: true|
|user_id|references|foreign_key: true, null: false|
|first_category_id|integer|foreign_key: true|
|second_category_id|integer|foreign_key: true|
|third_category_id|integer|foreign_key: true|

### Association
- has_many :product_images, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :comments, dependent: :destroy
- belongs_to :user
- belongs_to :brand, optional: true
- belongs_to :first_category, class_name: 'Category', foreign_key: "first_category_id"
- belongs_to :second_category, class_name: 'Category', foreign_key: 'second_category_id'
- belongs_to :third_category, class_name: 'Category', foreign_key: 'third_category_id'

## Product_images table

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_id|references|foreign_key: true, null: false|

### Association
- belongs_to :product, optional: true

## Comments table

|Column|Type|Options|
|------|----|-------|
|message|text|null: false|
|user_id|references|foreign_key: true, null: false|
|product_id|references|foreign_key: true, null: false|

### Association
- belongs_to :product

## Likes table

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true, null: false|
|product_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to: product, counter_cache: :likes_count

## Categories table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||

### Association
- has_many :products
- has_many :first_category_products, class_name: 'Product', foreign_key: 'first_category_id'
- has_many :second_category_products, class_name: 'Product', foreign_key: 'second_category_id'
- has_many :third_category_products, class_name: 'Product', foreign_key: 'third_category_id'
- has_ancestry

## Brand table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :products

## Payments table

|Column|Type|Options|
|------|----|-------|
|card_num|string|null: false, unique: true|
|expiration_month|integer|null: false|
|expiration_year|integer|null: false|
|security_code|integer|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user, optional: true

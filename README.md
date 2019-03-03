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

### Association
- has_many :products
- has_many :likes
- has_one :profile

## Profiles table

|Column|Type|Options|
|------|----|-------|
|profile|text||
|prefecture|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|postal_code|integer|null: false|
|building_name|string||
|telephone_num|integer||
|user_id|references|foreign_key: true|

## Association
- belongs_to :user

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
|bland|string||
|user_id|references|foreign_key: true|
|category_large_id|references|foreign_key: true|
|category_middle_id|references|foreign_key: true|
|category_small_id|references|foreign_key: true|

### Association
- has_many :product_images, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :comments, dependent: :destroy
- belongs_to :user
- belongs_to :category_large_id
- belongs_to :category_middle_id
- belongs_to :category_small_id

## Product_images table

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_id|references|foreign_key: true|

### Association
- belongs_to :product

## Comments table

|Column|Type|Options|
|------|----|-------|
|message|text|null: false|
|user_id|references|foreign_key: true|
|product_id|references|foreign_key: true|

### Association
- belongs_to :product

## Likes table

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|product_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to: product, counter_cache: :likes_count

## Category_larges table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :products
- has_many :category_middles

## Category_middles table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|category_large_id|references|foreign_key: true|

### Association

- has_many :products
- has_many :category_smalls
- belongs_to :category_large

## Category_small table

|Column|Type|Options|
|------|----|-------|
|name|string||
|category_middle_id|references|foreign_key: true|

### Association

- has_many :products
- belongs_to :category_middles



require 'csv'

CSV.read("db/csv/category.csv", headers: true).each do |row|
  user = Category.create!(
    id: row['id'],
    name: row['name'],
    created_at: row['create_at'],
    updated_at: row['updated_at'],
    ancestry: row['ancestry']
    )
end

CSV.read("db/csv/medium_category.csv", headers: true).each do |row|
  user = Category.create!(
    id: row['id'],
    name: row['name'],
    created_at: row['created_at'],
    updated_at: row['updated_at'],
    ancestry: row['ancestry']
    )
end

CSV.read("db/csv/small_category.csv", headers: true).each do |row|
  user = Category.create!(
    id: row['id'],
    name: row['name'],
    created_at: row['created_at'],
    updated_at: row['updated_at'],
    ancestry: row['ancestry']
  )
end

CSV.read("db/csv/brand.csv", headers: true).each do |row|
  user = Brand.create!(
    id: row['id'],
    name: row['name'],
    created_at: row['created_at'],
    updated_at: row['updated_at']
  )
end
  brand_id = 1
16.times do |n|
  name = Faker::JapaneseMedia::OnePiece.character
  description = 'いいね'
  price = 300
  size = 2
  product_status = 2
  transaction_status = 1
  category_id = 17
  delivery_fee = 1
  lead_time = 1
  local = 1
  first_category_id = 1
  second_category_id = 1
  third_category_id = 1
  product = Product.create(name: name, description: description, price: price, size: size, product_status: product_status, delivery_fee: delivery_fee, transaction_status: transaction_status, first_category_id: first_category_id, second_category_id: second_category_id, third_category_id: third_category_id, lead_time: lead_time, local: local, brand_id: brand_id)
  brand_id += 1
  if brand_id == 5
    brand_id = 1
  end
end

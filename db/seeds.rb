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
end

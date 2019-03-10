FactoryBot.define do
  factory :product_image do
    image {File.open("#{Rails.root}/public/images/test_image.jpg")}
    product
  end
end


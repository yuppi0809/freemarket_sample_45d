FactoryBot.define do
  factory :product do
    name                 {'アメリカンイーグルのTシャツ'}
    description          {'買ったばっかり'}
    size                 {'M'}
    product_status       {0}
    delivery_fee         {0}
    prefecture_id        {1}
    lead_time            {0}
    price                {'300'}
    transaction_status   {0}
    first_category_id       {create(:category).id}
    second_category_id       {create(:category).id}
    third_category_id       {create(:category).id}
    user
  end
end

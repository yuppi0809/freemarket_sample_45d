FactoryBot.define do
  factory :product do
    name                 {'アメリカンイーグルのTシャツ'}
    description          {'買ったばっかり'}
    size                 {'M'}
    product_status       {'新品、未使用'}
    delivery_fee         {'着払い'}
    local                {'北海道'}
    lead_time            {'1~2日で発送'}
    price                {'300'}
    transaction_status   {'listing'}
    first_category_id       {create(:category).id}
    second_category_id       {create(:category).id}
    third_category_id       {create(:category).id}
    user
  end
end

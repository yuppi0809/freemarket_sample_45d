FactoryBot.define do
  factory :product do
    name                 {'アメリカンイーグルのTシャツ'}
    description          {'買ったばっかり'}
    category_id          {'1'}
    product_status       {'新品、未使用'}
    delivery_fee         {'着払い'}
    local                {'北海道'}
    lead_time            {'1~2日で発送'}
    price                {'300'}
    transaction_status   {'出品中'}
  end
end

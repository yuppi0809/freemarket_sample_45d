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
<<<<<<< HEAD
    transaction_status   {0}
=======
    transaction_status   {'listing'}
>>>>>>> origin/【見た目】商品削除&サイドーバーのリンク_add_view_delete_function&add_link
    first_category_id       {create(:category).id}
    second_category_id       {create(:category).id}
    third_category_id       {create(:category).id}
    user
  end
end

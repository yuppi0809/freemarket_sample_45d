FactoryBot.define do

  factory :profile do
    delv_first_name            {'小川'}
    delv_last_name             {'純平'}
    delv_first_name_kana       {'オガワ'}
    delv_last_name_kana        {'ジュンペイ'}
    postal_code                {'123-4567'}
    prefecture                 {'東京都'}
    city                       {'渋谷区神宮前'}
    address                    {'4-3-2'}
  end

end

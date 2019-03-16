FactoryBot.define do

  factory :payment do
    card_num               {'1234123412341234'}
    expiration_month       {'12'}
    expiration_year        {'25'}
    security_code          {'123'}
  end

end

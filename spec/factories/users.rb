FactoryBot.define do

  factory :user do
    nickname              {'jj'}
    email                 {'test@gmail.com'}
    password              {'aaaaaa'}
    password_confirmation {'aaaaaa'}
    first_name            {'小川'}
    last_name             {'純平'}
    first_name_kana       {'オガワ'}
    last_name_kana        {'ジュンペイ'}
    birth_year            {'1991'}
    birth_month           {'10'}
    birth_day             {'15'}
    verify_sms            {'08012345678'}
  end

end

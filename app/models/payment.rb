class Payment < ApplicationRecord
  belongs_to :user, optional: true

  with_options presence: true do
    validates :card_num,        length: { in: 14..16 }
    validates :expiration_month
    validates :expiration_year
    validates :security_code,   length: { in: 3..4 }
  end
end

class SnsCredential < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :uid
    validates :user_id
    validates :provider
  end
end

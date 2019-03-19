class SnsCredential < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validate :uid
    validate :user_id
    validate :provider
  end
end

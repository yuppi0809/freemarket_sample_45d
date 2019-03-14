require 'rails_helper'
describe Like do
  describe '#create' do
    it 'is valid with all elements' do
      like = build(:like)
      expect(like).to be_valid
    end

    it 'is invalid without a user_id' do
      like = build(:like, user_id: nil)
      like.valid?
      expect(like.errors[:user]).to include("must exist")
    end

    it 'is invalid without a product_id' do
      like = build(:like, product_id: nil)
      like.valid?
      expect(like.errors[:product]).to include("must exist")
    end

  end
end

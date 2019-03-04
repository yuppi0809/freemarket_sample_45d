require 'rails_helper'
describe Product do
  describe '#create' do
    it 'is valid with a all elements' do
      product = build(:product)
      expect(product).to be_valid
    end

    it 'is invalid without a name' do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

  end
end

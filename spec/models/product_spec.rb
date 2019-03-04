require 'rails_helper'
describe Product do
  describe '#create' do
    it 'is valid with a all elements' do
      product = build(:product)
      expect(product).to be_valid
    end

    end
  end
end

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

    it 'is invalid without description' do
      product = build(:product, description: nil)
      product.valid?
      expect(product.errors[:description]).to include("can't be blank")
    end

    it 'is invalid without category_id' do
      product = build(:product, category_id: nil)
      product.valid?
      expect(product.errors[:category_id]).to include("can't be blank")
    end

    it 'is invalid without product_status' do
     product = build(:product, product_status: nil)
     product.valid?
     expect(product.errors[:product_status]).to include("can't be blank")
    end

    it 'is invalid without delivery_fee' do
      product = build(:product, delivery_fee: nil)
      product.valid?
      expect(product.errors[:delivery_fee]).to include("can't be blank")
    end

    it 'is invalid without local' do
      product = build(:product, local: nil)
      product.valid?
      expect(product.errors[:local]).to include("can't be blank")
    end

    it 'is invalid without local' do
      product = build(:product, lead_time: nil)
      product.valid?
      expect(product.errors[:lead_time]).to include("can't be blank")
    end
    it 'is invalid with a name that has more than 41 characters' do
      name = "n" * 41
      product = build(:product, name: name)
      product.valid?
      expect(product.errors[:name][0]).to include("is too long")
    end
    it 'is valid with a name that has less than 40 chatacters' do
      name = "a" * 40
      product = build(:product, name: name)
      product.valid?
      expect(product).to be_valid
    end
    it 'is invalid with a description that has more than 1000 characters' do
      string = "string" * 1001
      product = build
    end
  end
end

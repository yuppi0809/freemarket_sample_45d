require 'rails_helper'
describe Payment do
  describe '#create' do
    it 'is valid with all elements' do
      payment = build(:payment)
      expect(payment).to be_valid
    end

    it 'is invalid without a card_num' do
      payment = build(:payment, card_num: '')
      payment.valid?
      expect(payment.errors[:card_num]).to include("can't be blank")
    end

    it 'is invalid without a expiration_month' do
      payment = build(:payment, expiration_month: '')
      payment.valid?
      expect(payment.errors[:expiration_month]).to include("can't be blank")
    end

    it 'is invalid without a expiration_year' do
      payment = build(:payment, expiration_year: '')
      payment.valid?
      expect(payment.errors[:expiration_year]).to include("can't be blank")
    end

    it 'is invalid without a security_code' do
      payment = build(:payment, security_code: '')
      payment.valid?
      expect(payment.errors[:security_code]).to include("can't be blank")
    end

    it 'is invalid a card_num that has less than 13 characters' do
      payment = build(:payment, card_num: '1234123412345')
      payment.valid?
      expect(payment.errors[:card_num]).to include("is too short (minimum is 14 characters)")
    end

    it 'is invalid a card_num that has more than 17 characters' do
      payment = build(:payment, card_num: '12341234123412345')
      payment.valid?
      expect(payment.errors[:card_num]).to include("is too long (maximum is 16 characters)")
    end

    it 'is invalid a security_code that has less than 2 characters' do
      payment = build(:payment, security_code: '12')
      payment.valid?
      expect(payment.errors[:security_code]).to include("is too short (minimum is 3 characters)")
    end

    it 'is invalid a security_code that has more than 5 characters' do
      payment = build(:payment, security_code: '12345')
      payment.valid?
      expect(payment.errors[:security_code]).to include("is too long (maximum is 4 characters)")
    end
  end
end

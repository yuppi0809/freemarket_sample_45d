require 'rails_helper'
describe User do
  describe '#create' do
    it 'is valid with all elements' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'is invalid without a nickname' do
      user = build(:user, nickname: '')
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it 'is invalid without a email' do
      user = build(:user, email: '')
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is invalid without a password' do
      user = build(:user, password: '')
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it 'is invalid without a password_confirmation' do
      user = build(:user, password_confirmation: '')
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it 'is invalid without a first_name' do
      user = build(:user, first_name: '')
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it 'is invalid without a last_name' do
      user = build(:user, last_name: '')
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it 'is invalid without a first_name_kana' do
      user = build(:user, first_name_kana: '')
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    it 'is invalid without a last_name_kana' do
      user = build(:user, last_name_kana: '')
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end

    it 'is invalid without a birth_year' do
      user = build(:user, birth_year: '')
      user.valid?
      expect(user.errors[:birth_year]).to include("can't be blank")
    end

    it 'is invalid without a birth_month' do
      user = build(:user, birth_month: '')
      user.valid?
      expect(user.errors[:birth_month]).to include("can't be blank")
    end

    it 'is invalid without a birth_day' do
      user = build(:user, birth_day: '')
      user.valid?
      expect(user.errors[:birth_day]).to include("can't be blank")
    end

    it 'is invalid without a verify_sms' do
      user = build(:user, verify_sms: '')
      user.valid?
      expect(user.errors[:verify_sms]).to include("can't be blank")
    end

    it 'is invalid duplicate nickname' do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:nickname]).to include('has already been taken')
    end

    it 'is invalid duplicate email' do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include('has already been taken')
    end

    it 'is invalid with a password that has less than 5 characters' do
      user = build(:user, password: '12345')
      user.valid?
      expect(user.errors[:password][0]).to include('is too short')
    end

    it 'is valid with a password that has more tha 6 characters' do
      user = build(:user, password: '123456', password_confirmation: '123456')
      expect(user).to be_valid
    end
  end
end

require 'rails_helper'
describe Profile do
  describe '#create' do
    it 'is valid with all elements' do
      profile = build(:profile)
      expect(profile).to be_valid
    end

    it 'is invalid without a delv_first_name' do
      profile = build(:profile, delv_first_name: '')
      profile.valid?
      expect(profile.errors[:delv_first_name]).to include("can't be blank")
    end

    it 'is invalid without a delv_last_name' do
      profile = build(:profile, delv_last_name: '')
      profile.valid?
      expect(profile.errors[:delv_last_name]).to include("can't be blank")
    end

    it 'is invalid without a delv_first_name_kana' do
      profile = build(:profile, delv_first_name_kana: '')
      profile.valid?
      expect(profile.errors[:delv_first_name_kana]).to include("can't be blank")
    end

    it 'is invalid without a delv_last_name' do
      profile = build(:profile, delv_last_name_kana: '')
      profile.valid?
      expect(profile.errors[:delv_last_name_kana]).to include("can't be blank")
    end

    it 'is invalid without a postal_code' do
      profile = build(:profile, postal_code: '')
      profile.valid?
      expect(profile.errors[:postal_code]).to include("can't be blank")
    end

    it 'is invalid without a prefecture' do
      profile = build(:profile, prefecture: '')
      profile.valid?
      expect(profile.errors[:prefecture]).to include("can't be blank")
    end

    it 'is invalid without a city' do
      profile = build(:profile, city: '')
      profile.valid?
      expect(profile.errors[:city]).to include("can't be blank")
    end

    it 'is invalid without a address' do
      profile = build(:profile, address: '')
      profile.valid?
      expect(profile.errors[:address]).to include("can't be blank")
    end

    it 'is invalid a postal_code that has less than 7 characters' do
      profile = build(:profile, postal_code: '111-222')
      profile.valid?
      expect(profile.errors[:postal_code]).to include("is the wrong length (should be 8 characters)")
    end

    it 'is invalid a postal_code that has more than 9 characters' do
      profile = build(:profile, postal_code: '1111-2222')
      profile.valid?
      expect(profile.errors[:postal_code]).to include("is the wrong length (should be 8 characters)")
    end
  end
end

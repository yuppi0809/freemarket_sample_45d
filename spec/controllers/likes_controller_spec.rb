require 'rails_helper'

describe LikesController, type: :controller do
  let(:product){create(:product)}
  let(:user){product.user}

    before do
      login user
    end

  describe '#create' do
  describe '#destroy' do
  end
end

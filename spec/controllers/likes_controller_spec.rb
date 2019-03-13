require 'rails_helper'

describe LikesController, type: :controller do
  let(:product){create(:product)}
  let(:user){product.user}

    before do
      login user
    end

  describe '#create' do
    let(:params){{user_id: user.id, product_id: product.id }}

    subject {
      post :create,
      params: params,
      xhr: true
    }

    it 'count up message' do
      expect{ subject }.to change(Like, :count).by(1)
    end

    it 'assigns @product' do
      subject
      expect(assigns(:product)).to match(product)
    end
  end

  describe '#destroy' do
    it 'count down message' do
      like = create(:like, user: user, product: product)

      expect do
        delete :destroy, params: { id: like.id, product_id: product.id }, xhr: true
      end.to change(Like, :count).by(-1)
    end

    it 'assigns @product' do
      like = create(:like, user: user, product: product)
      delete :destroy, params: { id: like.id, product_id: product.id }, xhr: true
      expect(assigns(:product)).to match(product)
    end
  end
end

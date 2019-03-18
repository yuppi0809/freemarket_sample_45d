require 'rails_helper'

  describe ListingsController do
    before :each do
      @user = create(:user)
      @product = create(:product, user_id: @user.id)
      sign_in @user
    end

    describe '#destroy' do
      it '出品したものを削除' do
        expect do
        delete :destroy, params: { id: @product.id }, session: {}
        end.to change(Product, :count).by(-1)
      end

      it '商品情報削除に成功したらrootにredirectされる' do
        delete :destroy, params: { id: @product.id }, session: {}
        expect(response).to redirect_to (user_listings_path(@user.id))
      end
    end
  end

require 'rails_helper'

describe ProductsController, type: :controller do
  let(:product) {create(:product)}
  let(:user) {product.user}
  let(:category) {product.category}

    describe 'GET #show' do
      context "test the template and an intance variable holding one record" do

        before do
           get :show, params: {id: product}
        end

        it "renders the :show template" do
          expect(response).to render_template :show
        end

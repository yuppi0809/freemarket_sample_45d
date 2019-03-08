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

        it "assigns the requested product to @product" do
          expect(assigns(:product)).to eq product
        end
      end

    context "test @images" do
      it "only assigns the images of the product with params[:id]" do
        product2 = create(:product)
        create_list(:product_image, 2, product: product2)
        images = create_list(:product_image, 2, product: product)
        get :show, params: {id: product}
        expect(assigns(:images)).to eq images
      end

      it "can only have up to 4 images" do
        images = create_list(:product_image, 7, product: product)
        get :show, params: {id: product}
        expect(assigns(:images).size).to eq 4
      end
    end

    context "test @products" do
      it "does not include the record with the same id as params[:id]" do
        get :show, params: {id: product}
        expect(assigns(:products)).not_to include(product)
      end

      it "can only have up to 6 records" do
        create_list(:product, 7, user: user)
        get :show, params: {id: product}
        expect(assigns(:products).size).to eq 6
      end
    end

    context "test @category_products" do
      it "does not include the record with the same id as params[:id]" do
        get :show, params: {id: product}
        expect(assigns(:category_products)).not_to include product
      end

      it "can only have up to 6 records" do
        category_products = create_list(:product, 7, category: category)
        get :show, params: {id: product}
        expect(assigns(:category_products).size).to eq 6
      end
    end
  end
end

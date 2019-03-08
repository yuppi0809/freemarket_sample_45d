require 'rails_helper'

describe ProductsController do
  describe 'GET #index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
    it "assigns the requested categories to @categories" do
      categories = create_list(:category, 3)
      get :index
      expect(assigns(:categories)).to match(categories)
    end
    it "assigns the requested categories to @brands" do
       brands = create_list(:brand, 4)
       get :index
       expect(assigns(:brands)).to match(brands)
    end
  end
end

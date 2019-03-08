require 'rails_helper'

describe ProductsController do
  describe 'GET #index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
    it "assigns the requested categories to @categories" do
      create_list(:category, 7)
      get :index
      expect(assigns(:categories).size).to eq 3
    end
    it "assigns the requested categories to @brands" do
       create_list(:brand, 7)
       get :index
       expect(assigns(:brands).size).to eq 4
    end
  end
end

require 'rails_helper'

describe ProductsController, type: :controller do
  let(:product) {create(:product)}
  let(:user) {product.user}
  let(:category) {product.category}


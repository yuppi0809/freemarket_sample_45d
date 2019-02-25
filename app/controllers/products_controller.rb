class ProductsController < ApplicationController

  def new
    @product = Product.new
    render layout: 'sell-form'
  end

end

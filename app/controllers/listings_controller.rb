class ListingsController < ApplicationController

  def index
    @product = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end



  def destroy
    product = Product.find(params[:id])
    product.destroy
  end


  def update
  end

end

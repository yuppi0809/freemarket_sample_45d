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
    redirect_to action: :index, user_id: current_user.id
  end


  def update
  end

end

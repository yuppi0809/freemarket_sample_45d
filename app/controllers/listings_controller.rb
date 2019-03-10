class ListingsController < ApplicationController

  def index
    @product = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def delete
    # redirect_to controller: 'listings', action: 'index'
    redirect_to user_listings
  end

  # def destroy
  #   listings = listings.find(params[:id])
  #   listings.destroy if listings.user_id == current_user.id
  #   redirect_to user_listings
  # end


  def update
  end

end

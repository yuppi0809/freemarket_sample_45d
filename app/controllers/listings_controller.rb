class ListingsController < ApplicationController

  before_action :set_profile, only: [:show, :destroy]

  def index
    @products = Product.where(transaction_status: 0, user_id: current_user.id).reverse_order
  end

  def show
  end

  def destroy
    if @product.user_id == current_user.id
      @product.destroy
      redirect_to user_listings_path user_id: current_user.id
    else
      redirect_to user_listings_path user_id: current_user.id
    end
  end

  def update
  end

  def in_progress
    @products = Product.where(transaction_status: 1, user_id: current_user.id).reverse_order
  end
  def solds
    @products = Product.where(transaction_status: 2, user_id: current_user.id).reverse_order
  end

  private

  def set_profile
    @product = Product.find(params[:id])
  end

end

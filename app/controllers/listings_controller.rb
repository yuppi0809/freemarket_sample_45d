class ListingsController < ApplicationController

  before_action :set_profile, only: [:show, :destroy]

  def index
    @product = Product.all
  end

  def show
  end

  def destroy
    @product.destroy
    redirect_to action: :index, user_id: current_user.id
  end


  def update
  end

  private

  def set_profile
    @product = Product.find(params[:id])
  end

end

class ProductsController < ApplicationController

  def new
    @product = Product.new
    @product.product_images.build
  end

  def show
  end

  def confirm_purchase
  end

  def create
    product = Product.create(product_parameter)
    redirect_to root_path
  end

  private
  def product_parameter
    params.require(:product).permit(:name, :description, :category_id, :size, :product_status, :delivery_fee, :local, :lead_time, :price, :transaction_status, product_images_attributes: [:image])
  end
end

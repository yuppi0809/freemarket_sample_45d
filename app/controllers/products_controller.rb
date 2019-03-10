class ProductsController < ApplicationController

  def index
    @categories = Category.limit(3)
    @brands = Brand.limit(4)
  end

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
    params.require(:product).permit(:name, :description, :first_category_id, :second_category_id, :third_category_id, :size, :product_status, :delivery_fee, :local, :lead_time, :price, :transaction_status, product_images_attributes: [:image]).merge(user_id: current_user.id)
  end
end

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
    @product = Product.new(product_parameter)
    respond_to do |format|
      if @product.save
        params[:product_images][:image].each do |image|
          @product_image = @product.product_images.create(image: image, product_id: @product.id)
        end
        format.html{redirect_to root_path}
      else
        format.html{render action: 'new'}
      end
    end
  end

  private
  def product_parameter
    params.require(:product).permit(:name, :description, :first_category_id, :second_category_id, :third_category_id, :size, :product_status, :delivery_fee, :local, :lead_time, :price, :transaction_status, product_images_attributes: [:image]).merge(user_id: current_user.id)
  end
end

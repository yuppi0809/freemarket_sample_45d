class ProductsController < ApplicationController

  def new
    @product = Product.new
     @product.product_images.build
    render layout: 'sell-form'
  end

  def middlecategory
    @middlecategory = Category.find(params[:category_id]).children
    respond_to do |form|
      # form.html{redirect_to new_product_path}
      form.json{@middlecategory}
    end
  end

  def smallcategory
  end

  def create
    product = Product.create(product_parameter)
    binding.pry
    redirect_to root_path
  end

  private
  def product_parameter
    params.require(:product).permit(:name, :description, :category_id, :size, :product_status, :delivery_fee, :local, :lead_time, :price, :transaction_status, product_images_attribute: :image)
  end
end

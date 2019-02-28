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
    binding.pry
    Product.create(product_parameter)
  end

  private
  def product_parameter
    params.require(:product).permit(:name, :description, :category_id, :product_status, :delivery_fee, :local, :lead_time, :price, product_images_attributes: [:image])
  end

end

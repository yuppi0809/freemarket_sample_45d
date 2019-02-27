class ProductsController < ApplicationController

  def new
    @product = Product.new
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
  end

end

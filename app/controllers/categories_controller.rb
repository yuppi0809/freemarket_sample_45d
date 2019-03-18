class CategoriesController < ApplicationController
  def new
    @middlecategory = Category.find(params[:category_id]).children
    respond_to do |form|
      form.json{@middlecategory}
    end
  end
  def show
    @category = Category.find(params[:id])
    @products = @category.find_products(@category)
  end
end

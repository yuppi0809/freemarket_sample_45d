class CategoriesController < ApplicationController

  before_action :set_category, only: [:show]

  def new
    @middlecategory = Category.find(params[:category_id]).children
    respond_to do |form|
      form.json{@middlecategory}
    end
  end

  def show
    @products = @category.find_products(@category)
  end

  private

  def set_category
    @category = CategoryDecorator.decorate(Category.find(params[:id]))
  end
end

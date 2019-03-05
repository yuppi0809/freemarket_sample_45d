class CategoriesController < ApplicationController
  def new
    @middlecategory = Category.find(params[:category_id]).children
    respond_to do |form|
      form.json{@middlecategory}
    end
  end
end

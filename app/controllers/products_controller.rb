class ProductsController < ApplicationController

  def new
    render layout: 'sell-form'
  end

  def show
  end

  def purchase_confirm
    render layout: false
  end

end

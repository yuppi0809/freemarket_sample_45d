class ProductsController < ApplicationController

  def new
    render layout: 'sell-form'
  end

  def show
  end

  def confirm_purchase
    render layout: false
  end

end

class ProductsController < ApplicationController

  def new
    render layout: 'sell-form'
  end

  def show
  end

  def buy
    render layout: false
  end

end

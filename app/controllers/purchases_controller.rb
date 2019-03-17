class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product
  before_action :transaction_sold?

  def new
    @payment = PaymentDecorator.decorate(Payment.find_by(user_id: current_user.id))
    @profile = ProfileDecorator.decorate(Profile.find_by(user_id: current_user.id))
  end

  def create
    Payjp.api_key = PAYJP_SECRET_KEY
    Payjp::Charge.create(
      amount: @product.price,
      card: params['payjp-token'],
      currency: 'jpy'
    )
    @product.sold!
    redirect_to product_path(@product)
  end

  private

  def set_product
    @product = ProductDecorator.decorate(Product.find_by(id: params[:product_id]))
  end

  def transaction_sold?
    redirect_to product_path(@product) unless @product.transaction_status == 'listing'
  end
end

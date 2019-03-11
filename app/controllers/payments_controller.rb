class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :destroy]
  before_action :authenticate_user!

  def index
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.create(payment_params)
    redirect_to action: :show, id: current_user.id
  end

  def show
    redirect_to payments_path if @payment.blank?
  end

  def destroy
    @payment.destroy if @payment.user_id == current_user.id
    redirect_to action: :index
  end

  private

  def set_payment
    @payment = PaymentDecorator.decorate(Payment.find_by(user_id: current_user.id))
  end

  def payment_params
    params.require(:payment).permit(:card_num, :expiration_month, :expiration_year, :security_code).merge(user_id: current_user.id)
  end
end

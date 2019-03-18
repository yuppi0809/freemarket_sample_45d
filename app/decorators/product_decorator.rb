class ProductDecorator < Draper::Decorator
  delegate_all

  def edit_price_layout
    price = object.price.to_s(:delimited)
    "¥ #{price}"
  end

  def display_delivery_fee
    if object.delivery_fee === "include"
      return "送料込み"
    else
      return object.delivery_fee_i18n
    end
  end
end

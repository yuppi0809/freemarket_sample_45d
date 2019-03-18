class PaymentDecorator < Draper::Decorator
  delegate_all

  def hide_last_four_digits
    object.card_num.to_s.gsub!(/\d(?=(\D*\d){4})/, '*')
  end

  def replace_expiration
    month = '%02d' % object.expiration_month.to_s
    year = object.expiration_year.to_s
    object = month + '/' + year
  end
end

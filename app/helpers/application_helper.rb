module ApplicationHelper
  def get_expiration_month
    month = []
    1.upto(12) do |num|
      num = '%02d' % num
      month << num
    end
    return month
  end

  def get_expiration_year
    current_year = Date.today.strftime('%y').to_i
    year = [current_year]
    10.times do
      current_year += 1
      year << current_year
    end
  return year
  end
end

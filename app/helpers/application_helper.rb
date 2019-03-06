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

  def mypage_elements
    elements = ['マイページ', 'お知らせ', 'やることリスト', 'いいね！一覧', '出品する', '出品した商品 - 出品中', '出品した商品 - 取引中', '出品した商品 - 売却済み', '購入した商品 - 過去の取引', 'ニュース一覧', '評価一覧', 'ガイド', 'お問い合わせ']
  end

  def mypage_elements_merpay
    elements = ["売上・振込申請", "ポイント"]
  end

  def mypage_elements_setting
    elements = ["プロフィール", "発送元・お届け先住所変更", "支払い方法", "メール/パスワード", "本人情報", "電話番号の確認", "ログアウト"]
  end

  def create_link_if_present(item)
    if item.present?
      content_tag(:a, "#{item}", href: "#")
    end
  end

  def display_price(price)
    new_price = number_with_delimiter(price, :delimiter => ',')
    return "¥ #{new_price}"
  end

  def display_delivery_fee(option)
    if option === "送料込み（出品者負担）"
      return "送料込み"
    else
      return option
    end
  end
end




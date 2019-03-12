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
    elements = {
      'マイページ': '#',
      'お知らせ': '#',
      'やることリスト': '#',
      'いいね！一覧': '#',
      '出品する': new_product_path,
      '出品した商品 - 出品中': user_listings_path,
      '出品した商品 - 取引中': in_progress_user_listings_path,
      '出品した商品 - 売却済み': solds_user_listings_path,
      '購入した商品 - 過去の取引': '#',
      'ニュース一覧': '#',
      '評価一覧': '#',
      'ガイド': '#',
      'お問い合わせ': '#'
    }
  end

  def mypage_elements_merpay
    elements = ["売上・振込申請", "ポイント"]
  end

  def mypage_elements_setting
    elements = {
      "プロフィール": '#',
      "発送元・お届け先住所変更": edit_profile_path(current_user.id),
      "支払い方法": payment_path(current_user.id),
      "メール/パスワード": '#',
      "本人情報": user_path(current_user.id),
      "電話番号の確認": '#',
      "ログアウト": users_path
    }
  end

  def create_link_if_present(item)
    if item.present?
      content_tag(:a, "#{item.name}", href: "#")
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

  def registration_steps
    steps = [
      {name: '会員情報', class: 'registration-step__user-info'},
      {name: '電話番号認証', class: 'registration-step__verify'},
      {name: 'お届け先住所入力', class: 'registration-step__delivery'},
      {name: '支払い方法', class: 'registration-step__payment'},
      {name: '完了', class: 'registration-step__done'}
    ]
  end

  def get_status
    return '--complete' if controller.action_name == 'complete'
  end
end

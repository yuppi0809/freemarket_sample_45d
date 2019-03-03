module ApplicationHelper
  def mypage_elements
    elements = ['マイページ', 'お知らせ', 'やることリスト', 'いいね！一覧', '出品する', '出品した商品 - 出品中', '出品した商品 - 取引中', '出品した商品 - 売却済み', '購入した商品 - 過去の取引', 'ニュース一覧', '評価一覧', 'ガイド', 'お問い合わせ']
  end

  def mypage_elements_merpay
    elements = ["売上・振込申請", "ポイント"]
  end

  def mypage_elements_setting
    elements = ["プロフィール", "発送元・お届け先住所変更", "支払い方法", "メール/パスワード", "本人情報", "電話番号の確認", "ログアウト"]
  end
end



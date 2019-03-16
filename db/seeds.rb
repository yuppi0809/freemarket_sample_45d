men, women, book = Category.create([{name: "メンズ"}, {name: "レディース"}, {name: "本"}])
mtops, mbottoms = men.children.create([{name: "トップス"}, {name: "ボトムス"}])
wtops, wbottoms = women.children.create([{name: "トップス"}, {name: "ボトムス"}])
novel, commic = book.children.create([{name: "小説"}, {name: "マンガ"}])
mtshirts, mjacket = mtops.children.create([{name: "Tシャツ"}, {name: "ジャケット"}])
mdenim, mchino = mbottoms.children.create([{name: "デニム"}, {name: "チノパン"}])
wtshirts, wjacket = wtops.children.create([{name: "Tシャツ"}, {name: "ジャケット"}])
wdenim, wchino = wbottoms.children.create([{name: "デニム"}, {name: "チノパン"}])
fiction, nonfiction = novel.children.create([{name: "フィクション"}, {name: "ノンフィクション"}])
boycommic, girlcommic = commic.children.create([{name: "少年漫画"}, {name: "少女漫画"}])

brands = ['ユニクロ', 'アメリカンイーグル', 'シャネル', 'ビームス']

brands.each do |brand|
  Brand.create(name: brand)
end

#   brand_id = 1
# 16.times do |n|
#   name = Faker::JapaneseMedia::OnePiece.character
#   description = 'いいね'
#   price = 300
#   size = 2
#   product_status = 2
#   transaction_status = 1
#   category_id = 17
#   delivery_fee = 1
#   lead_time = 1
#   local = 1
#   first_category_id = 1
#   second_category_id = 1
#   third_category_id = 1
#   product = Product.create(name: name, description: description, price: price, size: size, product_status: product_status, delivery_fee: delivery_fee, transaction_status: transaction_status, first_category_id: first_category_id, second_category_id: second_category_id, third_category_id: third_category_id, lead_time: lead_time, local: local, brand_id: brand_id)
#   brand_id += 1
#   if brand_id == 5
#     brand_id = 1
#   end
# end

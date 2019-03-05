# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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

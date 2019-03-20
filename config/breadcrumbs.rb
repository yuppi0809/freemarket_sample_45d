
crumb :root do
  link "メルカリ", root_path
end

crumb :product do |product|
  link product.name, product
  parent :root
end

crumb :user do
  link "マイページ", mypages_path
  parent :root
end

crumb :user_transaction do
  link "出品した商品 - 出品中"
  parent :user, current_user
end

crumb :user_transaction_in_progress do
  link "出品した商品 - 取引中"
  parent :user, current_user
end

crumb :user_transaction_sold do
  link "出品した商品 - 売却済"
  parent :user, current_user
end

crumb :user_logout do
  link "ログアウト"
  parent :user, current_user
end

crumb :user_authentification do
  link "本人情報確認"
  parent :user, current_user
end

crumb :user_payment_method do |payment|
  link "お支払い方法", payment
  parent :user, current_user
end

crumb :user_shipping_info do
  link "発送元・お届け先住所変更"
  parent :user, current_user
end

crumb :category_list do
  link "カテゴリ一覧"
  parent :root
end

crumb :first_category do |first_category|
  link first_category.name, category_path(first_category)
  parent :category_list
end

crumb :second_category do |second_category|
  link second_category.name, category_path(second_category)
  parent :first_category, second_category.parent
end

crumb :third_category do |third_category|
  link third_category.name, category_path(third_category)
  parent :second_category, third_category.parent
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).

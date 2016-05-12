json.categories @categories do |category|
  json.extract! category, :category_name
  json.books category.books do |book|
    json.extract! book, :id, :title
  end
end
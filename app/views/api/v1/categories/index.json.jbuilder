json.categories @categories do |category|
  json.extract! category, :category_name
end
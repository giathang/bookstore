if @category.nil?
  json.error ("not found any category")
else
  json.extract! @category, :id, :category_name
end
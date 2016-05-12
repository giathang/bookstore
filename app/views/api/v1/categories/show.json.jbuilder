if @category.nil?
  json.error ("not found any category")
else
  json.category do
    json.extract! @category, :id, :category_name

    json.books @category.books do |book|
      json.extract! book, :id, :title
    end

  end
end
if @category.nil?
  json.error "Not found any Category"
else
  json.success "Delete success"
  json.extract! @category, :id, :category_name
end
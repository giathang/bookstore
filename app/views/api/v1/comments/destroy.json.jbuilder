if @book.nil?
  json.error "Not found any book"
else
  json.success "Delete success"
end
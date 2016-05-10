if @author.nil?
  json.error "not found any author"
else
  json.success "delete sucess"
end
if @book.nil?
  json.error "Not found any book"
else
  json.comment do
    json.extract! @comment, :id, :book_id, :commenter, :body
  end
end

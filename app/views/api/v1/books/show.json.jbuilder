json.book do
  json.extract! @book, :id, :isbn, :title, :des

  json.comments @book.comments do |comment|
    json.extract! comment, :commenter, :body
  end
  json.authors @book.authors do |author|
    json.extract! author, :name
  end
end
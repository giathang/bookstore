json.book do
  json.id @book.id
  json.isbn @book.isbn
  json.title @book.title
  json.des @book.des
  json.comments @book.comments do |comment|
    json.(comment, :commenter, :body)
  end
  json.authors @book.authors do |author|
    json.(author, :name)
  end
end
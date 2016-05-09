json.books @books do |book|
  json.(book, :isbn, :title, :des)
  json.comments book.comments do |comment|
    json.(comment, :commenter, :body)
  end
end
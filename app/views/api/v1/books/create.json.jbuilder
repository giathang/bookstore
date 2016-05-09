if @book.save
  json.set! :book do
    json.set! :title , @book.title
    json.set! :des , @book.des
    json.set! :isbn , @book.isbn
  end
else
  raise StandardError
end

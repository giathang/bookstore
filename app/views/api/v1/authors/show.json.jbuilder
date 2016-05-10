json.author do
  json.extract! @author,:name
  json.books @author.book do |book|
    json.extract! book, :id, :title
  end
end

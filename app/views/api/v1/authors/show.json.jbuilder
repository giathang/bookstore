if @author.nil?
  json.error ("not found any author")
else
  json.author do
    json.extract! @author,:name
    json.books @author.book do |book|
      json.extract! book, :id, :title
    end
  end
end
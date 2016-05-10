json.authors @authors do |author|
  json.(author,:id,:name)
  json.books author.book do|book|
      json.(book,:id,:title)
    end
end
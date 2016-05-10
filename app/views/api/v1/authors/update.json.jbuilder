if @author.nil?
  json.error ("not found any author")
else
  json.extract! @author, :name
end

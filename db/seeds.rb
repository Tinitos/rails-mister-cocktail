require 'open-uri'
require 'json'

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
serialized = open(url).read
json = JSON.parse(serialized)
json['drinks'].each do |drink|
  ingredient = Ingredient.new(name: drink["strIngredient1"])
  ingredient.save
end

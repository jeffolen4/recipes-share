json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :name, :directions, :rating
  json.url recipe_url(recipe, format: :json)
end

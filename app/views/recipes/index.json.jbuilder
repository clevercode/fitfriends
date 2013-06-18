json.array!(@recipes) do |recipe|
  json.extract! recipe, :recipe_name, :description
  json.url recipe_url(recipe, format: :json)
end

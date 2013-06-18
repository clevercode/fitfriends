json.array!(@foods) do |food|
  json.extract! food, :food_name, :carbs, :fat, :protein, :recipe_id
  json.url food_url(food, format: :json)
end

json.array!(@food_logs) do |food_log|
  json.extract! food_log, :food_name, :carbs, :fat, :protein, :consumed_at, :user_id
  json.url food_log_url(food_log, format: :json)
end

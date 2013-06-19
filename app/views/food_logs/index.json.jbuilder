json.array!(@food_logs) do |food_log|
  json.extract! food_log, :food_name, :carbs, :fat, :protein, :consumed_at, :user_id
  json.url user_food_log_url(@user, food_log, format: :json)
end

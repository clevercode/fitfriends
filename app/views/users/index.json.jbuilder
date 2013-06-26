json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :start_weight, :goal_weight, :current_weight, :height
  json.url user_url(user, format: :json)
  json.todays_carbs user.carbs_consumed
  json.todays_water user.water_consumed
  json.percentage_lost user.percentage_lost.round(1)
end

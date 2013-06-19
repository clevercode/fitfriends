json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :start_weight, :goal_weight, :current_weight, :height, :percentage_lost
  json.url user_url(user, format: :json)
  json.todays_carbs user.carbs_consumed(Date.today)
  json.todays_water user.water_consumed(Date.today)
end

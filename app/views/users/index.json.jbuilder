json.array!(@users) do |user|
  json.extract! user, :name, :email, :start_weight, :goal_weight, :current_weight, :height
  json.url user_url(user, format: :json)
end

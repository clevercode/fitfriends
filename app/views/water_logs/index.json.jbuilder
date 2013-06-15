json.array!(@water_logs) do |water_log|
  json.extract! water_log, :volume, :consumed_at, :user_id
  json.url water_log_url(water_log, format: :json)
end

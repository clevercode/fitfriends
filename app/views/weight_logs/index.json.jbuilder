json.array!(@weight_logs) do |weight_log|
  json.extract! weight_log, :weight, :measured_at, :user_id
  json.url user_weight_log_url(@user, weight_log, format: :json)
end

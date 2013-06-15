json.array!(@weight_logs) do |weight_log|
  json.extract! weight_log, :weight, :measured_at, :user_id
  json.url weight_log_url(weight_log, format: :json)
end

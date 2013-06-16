class WeightLog < ActiveRecord::Base

  # Associations
  belongs_to :user, inverse_of: :weight_logs

end

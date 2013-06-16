class WaterLog < ActiveRecord::Base

  # Associations
  belongs_to :user, inverse_of: :water_logs

end

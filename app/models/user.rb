class User < ActiveRecord::Base

  # Associations
  has_many :water_logs,  inverse_of: :user
  has_many :food_logs,   inverse_of: :user
  has_many :weight_logs, inverse_of: :user

end

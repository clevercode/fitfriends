class FoodLog < ActiveRecord::Base

  # Associations
  belongs_to :user, inverse_of: :food_logs

end

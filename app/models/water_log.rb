class WaterLog < ActiveRecord::Base
  before_save :convert_ounces_to_milliliters

  # Associations
  belongs_to :user, inverse_of: :water_logs

  def convert_ounces_to_milliliters
    ounces = self.volume
    self.volume = volume * 29.5735
  end
end

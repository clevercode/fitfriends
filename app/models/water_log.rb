class WaterLog < ActiveRecord::Base

  # Associations
  belongs_to :user, inverse_of: :water_logs

  validates :volume, :presence => true,
                     :numericality => { :greater_than => 0 }

  def volume_in_ounces
    self.volume ||= BigDecimal.new('0.0')
    self.volume * BigDecimal.new('0.033814')
  end

  def volume_in_ounces=(ounces)
    ounces = BigDecimal.new(ounces || '0.0')
    self.volume = ounces * BigDecimal.new('29.5735')
  end
end

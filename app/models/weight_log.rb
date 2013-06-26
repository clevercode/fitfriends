class WeightLog < ActiveRecord::Base
  after_save :set_user_current_weight

  # Associations
  belongs_to :user, inverse_of: :weight_logs

  def weight_in_lbs
    self.weight ||= BigDecimal.new("0.0")
    self.weight * 2.20462
  end

  def weight_in_lbs=(lbs)
    lbs = BigDecimal.new(lbs || 0.0)
    self.weight = lbs * 0.453592
  end

  def set_user_current_weight
    user = self.user
    user.current_weight = user.weight_logs.order('measured_at DESC').first.weight
    user.save
  end
end

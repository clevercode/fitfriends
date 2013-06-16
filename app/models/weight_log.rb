class WeightLog < ActiveRecord::Base
  before_save :convert_pounds_to_kilos
  after_save :set_user_current_weight

  # Associations
  belongs_to :user, inverse_of: :weight_logs

  def convert_pounds_to_kilos
    weight = self.weight
    self.weight = weight * 0.453592
  end

  def set_user_current_weight
    user = self.user
    user.current_weight = user.weight_logs.order('measured_at DESC').first.weight
    user.save
  end
end

class User < ActiveRecord::Base
  after_create :create_weight_log
  before_save :convert_height_and_weight

  # Associations
  has_many :water_logs,  inverse_of: :user
  has_many :food_logs,   inverse_of: :user
  has_many :weight_logs, inverse_of: :user

  def create_weight_log
    weight_log = WeightLog.new
    weight_log.weight = self.start_weight
    weight_log.measured_at = Time.now
    weight_log.user = self
    weight_log.save
  end

  def convert_height_and_weight
    self.start_weight = self.start_weight * 0.453592
    self.goal_weight = self.goal_weight * 0.453592
    self.height = self.height * 2.54
  end

end

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

  def avatar_url
    gravatar_id = Digest::MD5.hexdigest(self.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=64"
  end

  def water_consumed(date = Date.today)
    self.water_logs.where(:consumed_at => range_of_date(date)).sum(:volume)
  end

  def carbs_consumed(date = Date.today)
    self.food_logs.where(:consumed_at => range_of_date(date)).sum(:carbs)
  end

  def percentage_lost
    start_weight = self.start_weight
    kilos_lost = start_weight - self.current_weight
    kilos_to_lose = start_weight - self.goal_weight
    (kilos_lost / kilos_to_lose).round(2)
  end

  private

  def range_of_date(date)
    Range.new(date.beginning_of_day.utc,
              date.end_of_day.utc)
  end
end

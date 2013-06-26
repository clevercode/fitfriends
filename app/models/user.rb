class User < ActiveRecord::Base
  after_create :create_weight_log

  has_secure_password

  # Validations
  validates_uniqueness_of :email

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

  def start_weight_in_lbs
    self.start_weight ||= 0
    self.start_weight * 2.20462
  end

  def start_weight_in_lbs=(lbs)
    lbs = BigDecimal.new(lbs || 0.0)
    self.start_weight = lbs * 0.453592
  end

  def current_weight_in_lbs
    self.current_weight ||= 0
    self.current_weight * 2.20462
  end

  def goal_weight_in_lbs
    self.goal_weight ||= 0
    self.goal_weight * 2.20462
  end

  def goal_weight_in_lbs=(lbs)
    lbs = BigDecimal.new(lbs || 0)
    self.goal_weight = lbs * 0.453592
  end

  def height_in_inches
    self.height ||= 0.0
    self.height * 0.393701
  end

  def height_in_inches=(inches)
    inches = BigDecimal.new(inches || 0)
    self.height = inches * 2.54
  end

  def avatar_url
    gravatar_id = Digest::MD5.hexdigest(self.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=64"
  end

  def water_consumed(date = Time.zone.now.to_date)
    self.water_logs.where(:consumed_at => range_of_date(date)).sum(:volume)
  end

  def carbs_consumed(date = Time.zone.now.to_date)
    self.food_logs.where(:consumed_at => range_of_date(date)).sum(:carbs)
  end

  def percentage_lost
    start_weight = self.start_weight
    kilos_lost = start_weight - self.current_weight
    kilos_to_lose = start_weight - self.goal_weight
    ((kilos_lost / kilos_to_lose) * 100).round
  end

  private

  def range_of_date(date)
    Range.new(date.beginning_of_day.utc, date.end_of_day.utc)
  end
end

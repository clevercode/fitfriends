class Recipe < ActiveRecord::Base

  # Associations
  has_many :foods

  def carbs
    self.foods.sum(:carbs)
  end

  def protein
    self.foods.sum(:protein)
  end

  def fat
    self.foods.sum(:fat)
  end

end

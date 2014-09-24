class Pet < ActiveRecord::Base
  has_many :foods


  def age
    today = Date.current
    today.day - self.created_at.day
  end


  def eaten_foods
    self.foods.map{|food| food.name }.compact
  end

  def food_score
    calories = []
    self.foods.map do |food|
      calories << food.calories
    end
    calories.sum(&:to_i) * 100 / self.max_weight
  end

end

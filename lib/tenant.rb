# WDI RSpec Apartment hw
# Blair Caple
# June 17, 2014

class Tenant
  CREDIT_RATINGS = {
    760 => 'excellent',
    725 => 'great',
    660 => 'good',
    560 => 'mediocre',
    0 => 'bad'
  }

  attr_reader :name, :age
  attr_accessor :credit_score

  def initialize(name: name, age: age, credit_score: credit_score)
    @name, @age, @credit_score = name, age, credit_score
  end

  def credit_rating
    CREDIT_RATINGS.each { |k, v| return v if credit_score >= k }
  end
end

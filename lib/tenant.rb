require 'pry'

class Tenant
  attr_reader :name, :age, :credit_score

  def initialize(name, age, credit_score)
    @name, @age, @credit_score = name, age, credit_score

  end

  def credit_rating
    case self.credit_score
    when 760...800
      'excellent'
    when 725...759
      'great'
    when 660...724
      'good'
    when 560...659
      'mediocre'
    when 0...559
      'bad'
    end
  end
end

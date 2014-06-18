class Tenant
  attr_reader :name, :age, :credit_score

  def initialize(name, age, credit_score)
    @name, @age, @credit_score = name, age, credit_score
  end

  def credit_rating
    if credit_score >= 760
      'excellent'
    elsif credit_score >= 725
      'great'
    elsif credit_score >= 660
      'good'
    elsif credit_score >= 560
      'mediocre'
    else
      'bad'
    end
  end
end

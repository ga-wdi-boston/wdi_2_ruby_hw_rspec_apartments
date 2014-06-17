class Tenant

  attr_accessor :name, :age, :credit_score

  def initialize(name,age,credit_score)
    @name = name
    @age = age
    @credit_score = credit_score
  end

  def credit_rating
    case
    when credit_score >= 760
      'excellent'
    when credit_score >= 725
      'great'
    when credit_score >= 660
      'good'
    when credit_score >= 560
      'mediocre'
    when credit_score < 560
      'bad'
    end
  end

end

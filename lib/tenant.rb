class Tenant

  attr_accessor :name, :age, :credit_score

  def initialize(name, age, credit_score)
    @name = name
    @age = age
    @credit_score = credit_score
  end

  def credit_rating
    case
    when credit_score == 700 then 'good'
    when credit_score == 500 then 'bad'

    end
  end

end

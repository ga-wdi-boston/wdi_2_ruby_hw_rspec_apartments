class Tenant
  attr_reader :name, :age, :credit_score
  def initialize(name:, age:, credit_score:)
    @name, @age, @credit_score = name, age, credit_score
  end
  def credit_rating
    case credit_score
    when (0...560)
      "bad"
    when (560...660)
      "mediocre"
    when (660...725)
      "good"
    when (725...760)
      "great"
    else
      "excellent"
    end
  end
end


class Tenant
  attr_accessor :name, :age, :credit_score, :credit_rating

  def initialize(name, age, credit_score)
    @name, @age, @credit_score = name, age, credit_score
  end

  def credit_rating
    case credit_score
      when (0..559) then
        "bad"
      when (560..659) then
        "mediocre"
      when (660..724) then
        "good"
      else
        "excellent"
      end
  end

end

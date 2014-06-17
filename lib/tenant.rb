class Tenant

  attr_reader :name, :age, :credit_score

  def initialize(name: name, age: age, credit_score: credit_score)
    @name, @age, @credit_score = name, age, credit_score
  end

end

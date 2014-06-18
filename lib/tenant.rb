class Tenant
  attr_accessor :name, :age, :credit_score

  def initialize(name, age, credit_score)
    @name, @age, @credit_score = name, age, credit_score
  end

end

class Tenant
  attr_reader :name, :age, :credit_score

  def initialize(name:, age:, credit_score:)
    @name, @age, @credit_score = name, age, credit_score
  end

  def credit_rating
    case credit_score
    when 760..800 then :excellent
    when 725..759 then :great
    when 660..724 then :good
    when 560..659 then :mediocre
    when 300..559 then :bad
    end
  end
end

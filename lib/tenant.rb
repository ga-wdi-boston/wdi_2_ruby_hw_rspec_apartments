class Tenant
  attr_reader :name, :age, :credit_score

  def initialize(name:, age:, credit_score:)
    @name, @age, @credit_score = name, age, credit_score
  end

  def credit_rating
    Tenant.credit_rating_from_score(credit_score)
  end

  def self.credit_rating_from_score(credit)
    case
    when credit >= 760
      :excellent
    when credit >= 725
      :great
    when credit >= 660
      :good
    when credit >= 560
      :mediocre
    when credit < 560
      :bad
    end
  end
end

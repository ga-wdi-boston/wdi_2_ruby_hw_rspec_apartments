class Tenant

  CREDIT ={760 => "excellent", 725 => "great", 660 => "good", 560 => "mediocre", 0 => "bad"}

  attr_reader :name, :age, :credit_score

    def initialize(name:, age:, credit_score:)
      @name, @age, @credit_score = name, age, credit_score
    end

    def credit_rating
      CREDIT.each { |credit, rating| return rating if credit_score >= credit }
    end

  end

# has a name, age, and credit score
# has a credit rating, calculated from the credit score as follows:
# 760 or higher is "excellent"
# 725 or higher is "great"
# 660 or higher is "good"
# 560 or higher is "mediocre"
# anything lower is "bad"

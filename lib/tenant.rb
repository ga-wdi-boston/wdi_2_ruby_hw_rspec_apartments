require_relative 'credit_rating_chart.rb'

class Tenant

  include CreditConversion

  attr_reader :name, :age, :credit_score

  def initialize(name:, age:, credit_score:)
    @name, @age, @credit_score = name, age, credit_score
  end

  def credit_rating
    CREDIT_RATINGS.each { |rating, score| return rating.to_s if credit_score >= score }
    "bad"
  end

end

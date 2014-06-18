require_relative 'credit_rating'

class Tenant
  include CreditRating

  attr_reader :name, :age
  attr_accessor :credit_score

  def initialize(name:, age:, credit_score:)
    @name, @age, @credit_score = name, age, credit_score
  end
end

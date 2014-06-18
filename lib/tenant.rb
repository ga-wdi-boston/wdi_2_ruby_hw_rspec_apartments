require_relative 'credit_rating'

class Tenant
  include CreditRating

  attr_reader :age
  attr_accessor :credit_score, :name

  def initialize(name:, age:, credit_score:)
    @name, @age, @credit_score = name, age, credit_score
  end
end

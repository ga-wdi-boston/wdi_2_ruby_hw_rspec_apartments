# Jake Austin
# WDI Boston June rspec apartments
# June 17, 2014

class Tenant

  attr_reader :name, :age, :cred

  def initialize(name:, age:, cred:)
    @name, @age, @cred = name, age, cred
  end

end

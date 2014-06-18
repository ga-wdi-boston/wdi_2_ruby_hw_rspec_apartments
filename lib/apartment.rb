require_relative '../lib/tenant.rb'

class Apartment

  attr_accessor :number,:rent,:square_footage,:room,:bath,:tenants

  def initialize(number,rent,square_footage,room,bath,tenants = [])
    @number,@rent,@square_footage,@room,@bath = number,rent,square_footage,room,bath
    @tenants = []
  end

  def add_tenant(name,age,credit_score)
    tenants << Tenant.new(name,age,credit_score)
  end

end

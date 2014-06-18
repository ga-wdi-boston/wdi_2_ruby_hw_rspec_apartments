require_relative '../lib/tenant.rb'

class Apartment

  attr_accessor :number,:rent,:square_footage,:room,:bath,:tenants

  def initialize(number,rent,square_footage,room,bath,tenants = [])
    @number,@rent,@square_footage,@room,@bath = number,rent,square_footage,room,bath
    @tenants = []
  end

  def add_tenant(name,age,credit_score)
    if credit_score < 560
      raise ArgumentError, 'Bad credit score'
    elsif tenants.length >= room
      raise ArgumentError, 'Tenants exceed bedroom #'
    end

    tenants << Tenant.new(name,age,credit_score)
  end

  def delete_tenant(name)
    tenants.delete_if {|tenant| tenant.name == name}
  end

  def clear_tenant
    tenants.clear
  end

  def avg_credit
    tenants.map(&:credit_score).reduce(0, :+) /3
  end
end

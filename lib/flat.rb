require_relative '../lib/tenant'

class Flat

  attr_accessor :number, :rent, :sq_ft, :bed, :bath, :tenants

  def initialize(number, rent, sq_ft, bed, bath, tenants = [])
    @number = number
    @rent = rent
    @sq_ft = sq_ft
    @bed = bed
    @bath = bath
    @tenants = []
  end

  def add_tenant(name,age,credit_score)
    if credit_score < 560
      raise ArgumentError, 'Credit score is too low'
    elsif tenants.length >= bed
      raise ArgumentError, 'Too many tenants'
    end

    tenants << Tenant.new(name, age, credit_score)
  end

  def rem_tenant(name)

    tenants.delete_if {|tenant| tenant.name == name}
  end

  def clear_tenants
    tenants = []

  end

  def mean_credit
    tenants.map(&:credit_score).reduce(:+) / 3
  end


end

#require_relative '../lib/tenant'

class Apartment
  CREDIT ={760 => "excellent", 725 => "great", 660 => "good", 560 => "mediocre", 0 => "bad"}

  attr_reader :number, :sq_footage, :num_bedrooms, :num_bathrooms, :tenants, :tenant_count
  attr_accessor :rent

  def initialize(number:, sq_footage:, num_bedrooms:, num_bathrooms:, rent:)
    @number, @sq_footage, @num_bedrooms, @num_bathrooms, @rent = number, sq_footage, num_bedrooms, num_bathrooms, rent
    @tenant_count = 0
    @tenants = []
  end

  def add_tenant(tenant)
    if tenant.credit_rating == "bad"
      raise "Do not rent to this tenant. They have a bad credit score."
    elsif tenant_count == num_bedrooms
      raise "Do not rent to this tenant. The apartment is full."
    else
      tenants.push(tenant)
    end
  end

  def credit_rating
    CREDIT.each { |credit, rating| return rating if credit_score >= credit }
  end

  def remove_tenant(tenant)
    if tenant.class == Tenant && tenants.include?(tenant)
      tenants.delete(tenant)
    elsif tenants.map(&:name).include?(tenant)
      tenants.delete_if { |person| person.name == tenant }
    else
      raise "That tenant is not in the apartment."
    end
  end

  def remove_all_tenants
    @tenants = []
  end

  def tenant_count
    tenants.length
  end

  def credit_score
    (tenants.map(&:credit_score).reduce(0,:+) / tenants.length) if tenants.any?
  end

end


require_relative 'credit_rating'

class Apartment
  include CreditRating

  attr_reader :number, :rent, :sq_ft, :num_bedrooms, :num_bathrooms, :tenants

  def initialize(number:, rent:, sq_ft:, num_bedrooms:, num_bathrooms:)
    @number, @rent, @sq_ft, @num_bedrooms, @num_bathrooms = number, rent, sq_ft, num_bedrooms, num_bathrooms
    @tenants = []
  end

  def tenants
    tenants = @tenants
  end

  def add_tenant(tenant)
    raise "Bad credit rating" if tenant.credit_rating == 'bad'
    raise "Apartment full" if tenants.length == num_bedrooms
    self.tenants << tenant
  end

  def remove_tenant(tenant)
    tenant = tenant.name if tenant.class == Tenant
    raise "Tenant not found" unless tenants.map(&:name).include?(tenant)
    self.tenants.delete_if { |person| person.name == tenant }
  end

  def remove_all
    self.tenants.clear
  end

  def credit_score
    tenants.map(&:credit_score).reduce(0, &:+) / tenants.length
  end
end

class Apartment
  attr_reader :number, :rent, :sq_ft, :num_bedrooms, :num_bathrooms, :tenants

  def initialize(number:, rent:, sq_ft:, num_bedrooms:, num_bathrooms:)
    @number, @rent, @sq_ft, @num_bedrooms, @num_bathrooms = number, rent, sq_ft, num_bedrooms, num_bathrooms
    @tenants = []
  end

  def tenant
    tenant = @tenant
  end

  def add_tenant(tenant)
    @tenants << tenant
  end
end

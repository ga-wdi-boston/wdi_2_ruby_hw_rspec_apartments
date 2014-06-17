class Apartment
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
    @tenants << tenant
  end
end

class Apartment

  attr_reader :number, :rent, :square_footage, :bedrooms, :bathrooms, :tenants

  def initialize (number:, rent:, square_footage:, bedrooms:, bathrooms:)
    @number, @rent, @square_footage, @bedrooms, @bathrooms = number, rent, square_footage, bedrooms, bathrooms
    @tenants = []
  end

  def add_tenant(tenant)
    raise ArgumentError if tenant.credit_rating == 'bad'
    raise ArgumentError if tenants.length == self.bedrooms
    self.tenants << tenant
  end

end

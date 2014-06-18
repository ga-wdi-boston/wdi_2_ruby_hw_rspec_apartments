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

  def evict(tenant)
    candidate = tenants.find { |i| i.name.casecmp(tenant) } if tenant.class == String
    candidate = tenants.find { |i| i.object_id == tenant } if tenant.class == Fixnum
    if !tenants.delete(candidate)
      raise ArgumentError
    end
  end

end

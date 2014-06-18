class Apartment
  class FullError < StandardError; end
  class BadCreditError < StandardError; end

  attr_reader :number, :rent, :square_feet, :bedrooms, :bathrooms

  def initialize(number:, rent:, square_feet:, bedrooms:, bathrooms:)
    @number, @rent = number, rent
    @square_feet, @bedrooms, @bathrooms = square_feet, bedrooms, bathrooms
    @tenants = []
  end

  def tenants
    @tenants.dup # Return a duplicated copy, so the original remains private
  end

  def add_tenant(tenant)
    raise FullError if @tenants.count == bedrooms
    raise BadCreditError if tenant.credit_rating == :bad

    @tenants << tenant
  end
end

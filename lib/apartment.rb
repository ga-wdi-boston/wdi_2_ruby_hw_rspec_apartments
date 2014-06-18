class Apartment
  attr_reader :number, :rent, :square_feet, :bedrooms, :bathrooms

  def initialize(number:, rent:, square_feet:, bedrooms:, bathrooms:)
    @number, @rent = number, rent
    @square_feet, @bedrooms, @bathrooms = square_feet, bedrooms, bathrooms
    @tenants = []
  end

  def tenants
    @tenants.dup # Return a duplicated copy, so the original remains private
  end
end

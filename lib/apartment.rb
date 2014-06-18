class Apartment
  attr_reader :number, :rent, :square_feet, :bedrooms, :bathrooms

  def initialize(number:, rent:, square_feet:, bedrooms:, bathrooms:)
    @number, @rent = number, rent
    @square_feet, @bedrooms, @bathrooms = square_feet, bedrooms, bathrooms
  end
end

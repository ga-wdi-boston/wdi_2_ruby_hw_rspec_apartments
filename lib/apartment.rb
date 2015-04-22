class Apartment
  attr_accessor :number, :rent, :square_footage, :bedrooms, :bathrooms

  def initialize(number, rent, square_footage, bedrooms, bathrooms)
    @number, @rent, @square_footage, @bedrooms, @bathrooms = number, rent, square_footage, bedrooms, bathrooms
  end

end

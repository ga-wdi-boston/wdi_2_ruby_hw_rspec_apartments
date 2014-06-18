class Apartment
  attr_reader :number, :rent, :sq_footage, :bedrooms, :bathrooms
  def initialize(number, rent, sq_footage, bedrooms, bathrooms)
    @number, @rent, @sq_footage, @bedrooms, @bathrooms = number, rent, sq_footage, bedrooms, bathrooms
  end
end

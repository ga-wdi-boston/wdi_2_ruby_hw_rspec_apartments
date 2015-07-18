class Apartment
  attr_accessor :number, :rent, :sq_footage, :bedrooms, :bathrooms
  attr_reader :tenants

  def initialize(number, rent, sq_footage, bedrooms, bathrooms)
    @number = number
    @rent = rent
    @sq_footage = sq_footage
    @bedrooms = bedrooms
    @bathrooms = bathrooms
    @tenants = []

  end


end

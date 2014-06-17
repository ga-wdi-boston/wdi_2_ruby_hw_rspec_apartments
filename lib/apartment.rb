class Apartment
  attr_reader :number, :rent, :sq_ft, :num_bedrooms, :num_bathrooms, :tenants

  def initialize(number:, rent:, sq_ft:, num_bedrooms:, num_bathrooms:)
    @number, @rent, @sq_ft, @num_bedrooms, @num_bathrooms = number, rent, sq_ft, num_bedrooms, num_bathrooms
    @tenants = []
  end
end

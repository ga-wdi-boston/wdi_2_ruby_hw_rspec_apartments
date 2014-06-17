class Apartment
  attr_reader :number, :rent, :sq_ft, :beds, :baths, :tenants

  def initialize(number:, rent:, sq_ft:, beds:, baths:)
    @number, @rent, @sq_ft, @beds, @baths = number, rent, sq_ft, beds, baths
  end

  def add_tenant(tenant)
  end

end

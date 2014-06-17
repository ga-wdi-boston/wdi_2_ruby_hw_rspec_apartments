class Apartment
  attr_reader :number, :rent, :sq_ft, :beds, :baths, :tenants

  def initialize(number:, rent:, sq_ft:, beds:, baths:)
    @number, @rent, @sq_ft, @beds, @baths = number, rent, sq_ft, beds, baths
  end

  def add_tenant(tenant)
    if tenant.credit_rating == "bad"
      raise ArgumentError, "This tenant has a bad credit rating"
    end
  end

end

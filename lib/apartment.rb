class Apartment
  attr_reader :number, :rent, :sq_ft, :beds, :baths, :tenants

  def initialize(number:, rent:, sq_ft:, beds:, baths:)
    @number, @rent, @sq_ft, @beds, @baths = number, rent, sq_ft, beds, baths
    @tenants = []
  end

  def add_tenant(tenant)
    if tenant.credit_rating == "bad"
      raise ArgumentError, "This tenant has a bad credit rating"
    end
    if tenants.length >= beds
      raise ArgumentError, "This apartment is full"
    end
    @tenants.push(tenant)
  end

  def remove_tenant(name:)
    if tenants.any? { |person| person.name == name }
      tenants.delete_if { |person| person.name == name }
    end
  end


end

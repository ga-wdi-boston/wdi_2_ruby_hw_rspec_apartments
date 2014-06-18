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

  def remove_tenant(name: nil, obj: nil)
    if tenants.any? { |person| person.name == name }
      tenants.delete_if { |person| person.name == name }
    elsif tenants.include?(obj)
      tenants.delete(obj)
    else
      raise ArgumentError, "Tenant not found"
    end
  end

  def evict
    @tenants = []
  end

  def credit_score
    if tenants.empty?
      nil
    else
      tenants.map{ |person| person.credit_score }.reduce(0, &:+)/tenants.length
    end
  end

end

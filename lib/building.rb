class Building

  attr_reader :address, :apartments

  def initialize(address:)
    @address = address
    @apartments = []
  end

  def add_apartment(apartment)
    apartments << apartment
  end

  def remove_apartment(apt_number)
    candidate = apartments.find { |apartment| apartment.number == apt_number }
    raise ArgumentError, 'could not find apartment with that number' if candidate == nil
    raise ArgumentError, 'cannot remove occupied apartment' if candidate.tenants != []
    apartments.delete(candidate)
  end

  def square_footage
    apartments.map(&:square_footage).reduce(0, &:+)
  end

  def monthly_revenue
    apartments.map(&:rent).reduce(0, &:+)
  end

end

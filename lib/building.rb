class Building
  class OccupiedError < StandardError; end

  attr_reader :address

  def initialize(address)
    @address = address
    @apartments = []
  end

  def apartments
    @apartments.dup # Return a duplicated copy, so the original remains private
  end

  def add_apartment(apartment)
    @apartments << apartment
  end

  def remove_apartment(number, remove_tenants: false)
    target_apartment = @apartments.find{ |apartment| apartment.number == number }
    raise OccupiedError unless target_apartment.tenants.empty? || remove_tenants
    target_apartment.remove_all_tenants
    @apartments.delete(target_apartment)
  end

  def total_square_feet
    @apartments.map(&:square_feet).reduce(0, &:+)
  end
end

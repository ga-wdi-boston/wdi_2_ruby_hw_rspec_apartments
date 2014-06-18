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
    apartments.delete(candidate)
  end

end

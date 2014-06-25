class Building
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
end

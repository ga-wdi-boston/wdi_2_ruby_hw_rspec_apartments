class Building
  attr_reader :address, :apartments

  def initialize(address:)
    @address = address
    @apartments = []
  end

  def add_apartment(apartment)
    @apartments << apartment
  end

  def remove_apartment(number)
    @apartments.delete_if { |apartment| apartment.number == number }
  end
end

require_relative 'apartment'

class Building

  attr_reader :address, :apartments

  def initialize(address:)
    @address = address
    @apartments = []
  end

  def add_appt(appt)
    @apartments << appt
  end

end

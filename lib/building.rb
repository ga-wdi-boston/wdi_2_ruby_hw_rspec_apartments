require_relative 'apartment'

class Building

  attr_reader :address, :apartments

  def initialize(address:)
    @address = address
    @apartments = []
  end
end

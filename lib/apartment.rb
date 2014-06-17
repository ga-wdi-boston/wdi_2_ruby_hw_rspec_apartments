class Apartment
  attr_reader :number, :rent, :sq_ft, :beds, :baths

  def initialize(number:, rent:, sq_ft:, beds:, baths:)
    @number, @rent, @sq_ft, @beds, @baths = number, rent, sq_ft, beds, baths

  end

end

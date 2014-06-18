class Flat

attr_reader :number, :rent, :sq_ft, :bed, :bath

  def initialize(number, rent, sq_ft, bed, bath)
    @number = number
    @rent = rent
    @sq_ft = sq_ft
    @bed = bed
    @bath = bath
  end
end

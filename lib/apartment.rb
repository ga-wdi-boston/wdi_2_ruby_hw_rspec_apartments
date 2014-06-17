class Apartment

  attr_accessor :number,:rent,:square_footage,:room,:bath

  def initialize(number,rent,square_footage,room,bath)
    @number,@rent,@square_footage,@room,@bath = number,rent,square_footage,room,bath

  end
end

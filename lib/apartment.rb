# Jake Austin
# WDI Boston June rspec apartments
# June 17, 2014

require_relative 'tenant'

class Apartment
  CRED_RATINGS = {
                    760 => 'excellent',
                    725 => 'great',
                    660 => 'good',
                    560 => 'mediocre',
                    0 => 'bad'
                  }
  attr_reader :number, :sq_feet, :num_beds, :num_baths, :rent

  def initialize(number:, sq_feet:, num_beds:, num_baths:, rent:)
    @number, @sq_feet, @num_beds, @num_baths, @rent = number, sq_feet, num_beds, num_baths, rent

  end

end

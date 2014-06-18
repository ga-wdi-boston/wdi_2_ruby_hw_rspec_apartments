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
  attr_reader :tenants, :number, :sq_feet, :num_beds, :num_baths, :rent

  def initialize(number:, sq_feet:, num_beds:, num_baths:, rent:)
    @number, @sq_feet, @num_beds, @num_baths, @rent = number, sq_feet, num_beds, num_baths, rent
    @tenants = []
  end

  def add_tenant(applicant)
    raise "Bad credit, reject" unless applicant.cred >= 560
    raise "No vacancy, reject" unless tenants.count < num_beds
    @tenants << applicant
  end

  def remove_tenant(tenant)
    raise "Not a resident here" unless tenants.include?(tenant)
    @tenants.delete(tenant)
  end
end

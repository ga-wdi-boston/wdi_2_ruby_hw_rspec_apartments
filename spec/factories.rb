require_relative '../lib/tenant'
require_relative '../lib/apartment'

def new_tenant(name: 'x', age: 30, credit_score: 700)
  Tenant.new(name: name, age: age, credit_score: credit_score)
end

def new_apartment(number: '1B', rent: 2000, square_feet: 600, bedrooms: 1, bathrooms: 1, tenants: [])
  apartment = Apartment.new(number: number, rent: rent, square_feet: square_feet, bedrooms: bedrooms, bathrooms: bathrooms)
  tenants.each{ |tenant| apartment.add_tenant(tenant) }
  apartment
end

def new_building(address = '123 Main Street', apartments: [])
  building = Building.new(address)
  apartments.each{ |apartment| building.add_apartment(apartment) }
  building
end

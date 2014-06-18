require_relative "../lib/tenant.rb"
require_relative "../lib/apartment.rb"

module Factory

  def new_tenant(name: "Zack", age: 24, credit_score: 700)
    Tenant.new(name: name, age: age, credit_score: credit_score)
  end

  def new_apartment(number: 2, rent: 4400, square_footage: 1000, bedrooms: 4, bathrooms: 2)
    Apartment.new(number: number, rent: rent, square_footage: square_footage, bedrooms: bedrooms, bathrooms: bathrooms)
  end

  def new_building(address: '241 Washington St.')
    Building.new(address: address)
    # [new_apartment, new_apartment(number: 1, rent: 2200, square_footage: 500, bedrooms: 2, bathrooms: 1)]
  end

end

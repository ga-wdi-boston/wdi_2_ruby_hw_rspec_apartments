require_relative '../lib/apartment'
require_relative '../lib/tenant'

describe Apartment do
  def new_apartment(number: '1B', rent: 2000, square_feet: 600, bedrooms: 1, bathrooms: 1)
    Apartment.new(number: number, rent: rent, square_feet: square_feet, bedrooms: bedrooms, bathrooms: bathrooms)
  end

  def new_tenant(name: 'x', age: 30, credit_score: 700)
    Tenant.new(name: name, age: age, credit_score: credit_score)
  end

  describe '#initialize' do
    it 'requires a number, rent, square footage, bedrooms, and bathrooms' do
      apartment = Apartment.new(
        number: '3F',
        rent: 2500,
        square_feet: 820,
        bedrooms: 2,
        bathrooms: 1
      )

      expect(apartment.number).to eq '3F'
      expect(apartment.rent).to eq 2500
      expect(apartment.square_feet).to eq 820
      expect(apartment.bedrooms).to eq 2
      expect(apartment.bathrooms).to eq 1
    end
  end

  describe '#tenants' do
    it 'is initially empty' do
      expect(new_apartment.tenants).to be_empty
    end

    it 'cannot be modified directly' do
      apartment = new_apartment

      apartment.tenants.push(new_tenant)

      expect(apartment.tenants).to be_empty
    end
  end
end

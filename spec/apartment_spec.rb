require_relative '../lib/apartment'

describe Apartment do
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
end

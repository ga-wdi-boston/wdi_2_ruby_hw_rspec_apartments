require_relative "../lib/apartment"

describe Apartment do

  describe 'attributes' do
    it 'has a number, rent, square footage, number of bedrooms and number of bathrooms' do
      apartment = Apartment.new(1, 500, 500, 2, 1)

      expect(apartment.number).to eq 1
      expect(apartment.rent).to eq 500
      expect(apartment.sq_footage).to eq 500
      expect(apartment.bedrooms).to eq 2
      expect(apartment.bathrooms).to eq 1
    end
  end

end



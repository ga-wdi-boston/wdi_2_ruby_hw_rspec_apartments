require_relative '../lib/apartment'

describe Apartment do
  describe 'attributes' do
    it 'has a number, rent, square footage, number of bedrooms, number of bathrooms' do
      expect(new_apartment.number).to eq 1
      expect(new_apartment.rent).to eq 1000
      expect(new_apartment.sq_ft).to eq 2000
      expect(new_apartment.num_bedrooms).to eq 2
      expect(new_apartment.num_bathrooms).to eq 2
      expect(new_apartment.tenants).to eq []
    end
  end

  # apartment factory object
  def new_apartment(number: 1, rent: 1000, sq_ft: 2000, num_bedrooms: 2, num_bathrooms: 2)
    apartment = Apartment.new(number: number, rent: rent, sq_ft: sq_ft, num_bedrooms: num_bedrooms, num_bathrooms: num_bathrooms)
    apartment
  end
end

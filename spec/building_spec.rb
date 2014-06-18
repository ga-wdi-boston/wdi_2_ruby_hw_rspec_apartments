require_relative '../lib/building'
require_relative '../lib/apartment'

describe Building do
  let(:building) { Building.new(address: "100 1st St") }
  describe 'attributes' do
    it 'has an address' do
      expect(building.address).to eq "100 1st St"
      expect(building.apartments.class).to eq Array
    end
  end

  describe '#add_apartment' do
    it 'adds an apartment' do
      apartment = new_apartment
      building.add_apartment(apartment)

      expect(building.apartments).to match_array [apartment]
    end
  end

  describe '#remove_apartment' do
    it 'removes an apartment' do
      apartment = new_apartment
      building.add_apartment(apartment)
      building.remove_apartment(apartment.number)

      expect(building.apartments).to eq []
    end
  end

  # factory object
  def new_apartment(number: 1, rent: 1000, sq_ft: 2000, num_bedrooms: 2, num_bathrooms: 2)
    apartment = Apartment.new(number: number, rent: rent, sq_ft: sq_ft, num_bedrooms: num_bedrooms, num_bathrooms: num_bathrooms)
    apartment
  end
end

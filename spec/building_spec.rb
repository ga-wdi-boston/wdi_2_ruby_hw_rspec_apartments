require_relative 'factories'
require_relative '../lib/building'

describe Building do
  describe '#initialize' do
    it 'requires an address' do
      building = Building.new('123 Main Street')

      expect(building.address).to eq '123 Main Street'
    end
  end

  describe '#apartments' do
    it 'is initially empty' do
      expect(new_building.apartments).to be_empty
    end

    it 'cannot be modified directly' do
      building = new_building

      building.apartments.push(new_apartment)

      expect(building.apartments).to be_empty
    end
  end

  describe '#add_apartment' do
    it 'adds an apartment to the building' do
      building = new_building
      apartment = new_apartment

      building.add_apartment(apartment)

      expect(building.apartments).to contain_exactly(apartment)
    end
  end

  describe '#remove_apartment' do
    it 'removes an apartment by number' do
      apartment_2b = new_apartment(number: '2B')
      apartment_not2b = new_apartment(number: '2F')
      building = new_building(apartments: [apartment_2b, apartment_not2b])

      building.remove_apartment('2F')

      expect(building.apartments).to contain_exactly(apartment_2b)
    end

    it 'errors when attempting to remove an occupied apartment' do
      apartment = new_apartment(number: '5F', tenants: [new_tenant])
      building = new_building(apartments: [apartment])

      expect{ building.remove_apartment('5F') }.to raise_error Building::OccupiedError
    end

    it 'allows removing an occupied apartment with an option' do
      apartment = new_apartment(number: '5F', tenants: [new_tenant])
      building = new_building(apartments: [apartment])

      building.remove_apartment('5F', remove_tenants: true)

      expect(building.apartments).to be_empty
    end
  end

  describe '#total_square_feet' do
    it 'sums the square footage of all apartments' do
      apartments = [
        new_apartment(square_feet: 500),
        new_apartment(square_feet: 750),
        new_apartment(square_feet: 630)
      ]
      building = new_building(apartments: apartments)

      expect(building.total_square_feet).to eq 1880
    end
  end

  describe '#monthly_revenue' do
    it 'sums the rents of all apartments' do
      apartments = [
        new_apartment(rent: 1700),
        new_apartment(rent: 2150),
        new_apartment(rent: 1520)
      ]
      building = new_building(apartments: apartments)

      expect(building.monthly_revenue).to eq 5370
    end
  end

  describe '#tenants' do
    it 'collects the tenants from all apartments' do
      tenants = []
      6.times{ tenants << new_tenant }
      apartments = [
        new_apartment(bedrooms: 2, tenants: [tenants[0], tenants[5]]),
        new_apartment(bedrooms: 3, tenants: [tenants[1], tenants[2], tenants[4]]),
        new_apartment(bedrooms: 1, tenants: [tenants[3]])
      ]
      building = new_building(apartments: apartments)

      expect(building.tenants).to match_array tenants
    end
  end
end

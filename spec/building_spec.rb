require_relative '../lib/building.rb'
require_relative '../lib/factories.rb'

describe Building do

  let(:building) { new_building }
  let(:home) { new_apartment }
  let(:downstairs) { new_apartment(number: 1, rent: 2200, square_footage: 500, bedrooms: 2, bathrooms: 1) }

  include Factory

  describe 'attributes' do
    it 'has an address and many tenants' do
      expect(building.address).to eq '241 Washington St.'
      expect(building.apartments).to eq []
    end
  end

  describe '#add_apartment' do
    it 'adds an apartment to the building' do
      building.add_apartment(home)
      building.add_apartment(downstairs)
      expect(building.apartments).to match_array [home, downstairs]
    end
  end

  describe '#remove_apartment' do
    it 'deletes an apartment from the building' do
      building.add_apartment(home)
      building.add_apartment(downstairs)
      building.remove_apartment(2)
      expect(building.apartments).to match_array [downstairs]
    end

    it 'raises an error if the apartment is not found' do
      building.add_apartment(home)
      building.add_apartment(downstairs)
      expect { building.remove_apartment(3) }.to raise_error(ArgumentError, 'could not find apartment with that number')
    end

    it 'raises an error if the apartment has tenants' do
      home.add_tenant(new_tenant)
      building.add_apartment(home)
      building.add_apartment(downstairs)
      expect { building.remove_apartment(2) }.to raise_error(ArgumentError, 'cannot remove occupied apartment')

    end
  end

  describe '#square_footage' do
    it 'calculates the building\'s total square_footage' do
      building.add_apartment(home)
      building.add_apartment(downstairs)
      expect(building.square_footage).to eq 1500
    end
  end







end


require_relative '../lib/building'

describe Building do
  describe 'attributes' do
    it 'has an address' do
      building = Building.new(address: "100 1st St")

      expect(building.address).to eq "100 1st St"
      expect(building.apartments.class).to eq Array
    end
  end
end

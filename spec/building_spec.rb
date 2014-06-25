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
end

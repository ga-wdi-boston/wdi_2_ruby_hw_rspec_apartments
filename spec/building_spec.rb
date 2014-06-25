require_relative 'factories'
require_relative '../lib/building'

describe Building do
  describe '#initialize' do
    it 'requires an address' do
      building = Building.new('123 Main Street')

      expect(building.address).to eq '123 Main Street'
    end
  end
end

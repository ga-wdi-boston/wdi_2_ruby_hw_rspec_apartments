# Jake Austin
# WDI Boston June rspec apartments
# June 17, 2014
require_relative '../lib/building'

describe Building do
  describe '#initialize' do
    it 'should have an address and apartments' do
      building = Building.new(address: '117 Glenville')

      expect(building.address).to eq '117 Glenville'
      expect(building.apartments).to eq []
    end
  end
end

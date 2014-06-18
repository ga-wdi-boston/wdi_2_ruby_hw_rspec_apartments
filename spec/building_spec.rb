require_relative '../lib/building.rb'
require_relative '../lib/factories.rb'

describe Building do

  let(:building) { new_building }

  include Factory

  describe 'attributes' do
    it 'has an address and many tenants' do
      expect(building.address).to eq '241 Washington St.'
      expect(building.apartments).to eq []
    end
  end

end


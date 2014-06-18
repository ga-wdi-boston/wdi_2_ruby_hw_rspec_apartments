# Jake Austin
# WDI Boston June rspec apartments
# June 17, 2014
require_relative '../lib/building'

describe Building do
  let(:building) { Building.new(address: '117 Glenville') }
  let(:apartment) { Apartment.new(number: 1, sq_feet: 5000, num_beds: 2, num_baths: 1, rent: 2000)
 }
  let(:jake) { Tenant.new(name: 'Jake', age: 21, cred: 700)
 }
  let(:chris) { Tenant.new(name: 'Chris', age: 21, cred: 600)
 }
  let(:reject_cred) { Tenant.new(name: 'Bad Cred', age: 21, cred: 500)
 }
  let(:late) { Tenant.new(name: 'Too Late', age: 21, cred: 700)
 }

  describe '#initialize' do
    it 'should have an address and apartments' do

      expect(building.address).to eq '117 Glenville'
      expect(building.apartments).to eq []
    end
  end

  describe '#add_appt' do
    it 'should add an apartment to the building' do
      building.add_appt(appt: apartment)

      expect(building.apartments).to eq [apartment]
    end
  end

  describe '#remove_appt' do
    it 'should remove an apartment if it is found by number, is empty OR is an eviction' do
      apartment.add_tenant(jake)
      building.add_appt(appt: apartment)

      expect{building.remove_appt(num: 0)}.to raise_error
      expect{building.remove_appt(num: 1)}.to raise_error

      building.remove_appt(num: 1, evict: true)

      expect(building.apartments).to eq []
    end
  end

  describe '#sq_footage' do
    it 'should calculate total sq footage based on apartments sq_feet total' do
      building.add_appt(appt: apartment)

      expect(building.sq_footage).to eq 5000
    end
  end
end

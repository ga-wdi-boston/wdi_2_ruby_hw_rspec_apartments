# Jake Austin
# WDI Boston June rspec apartments
# June 17, 2014

require_relative '../lib/tenant'
require_relative '../lib/apartment'

describe Tenant do
  describe '#initialize' do
    it 'should have name, age, and cred' do
      tenant = Tenant.new(name: 'Jake', age: 21, cred: 700)

      expect(tenant.name).to eq 'Jake'
      expect(tenant.age).to eq 21
      expect(tenant.cred).to eq 700
    end
  end
end

describe Apartment do
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
    it 'should have number, sq_feet, num_beds, num_baths, rent' do

      expect(apartment.number).to eq 1
      expect(apartment.sq_feet).to eq 5000
      expect(apartment.num_beds).to eq 2
      expect(apartment.num_baths).to eq 1
      expect(apartment.rent).to eq 2000
      expect(apartment.tenants).to match_array []
    end
  end

  describe '#add_tenant' do
    it 'should add tenant, barring exceptions' do
      apartment.add_tenant(jake)
      apartment.add_tenant(chris)

      expect(apartment.tenants).to match_array [jake, chris]
      expect{ apartment.add_tenant(reject_cred) }.to raise_error
      expect{ apartment.add_tenant(late) }.to raise_error
    end
  end

  describe '#remove_tenant' do
    it 'should remove specified tenant, if present' do
      apartment.add_tenant(jake)
      apartment.remove_tenant(jake)

      expect(apartment.tenants).to eq []
      expect{ apartment.remove_tenant(chris) }.to raise_error
    end
  end

  describe '#remove_all' do
    it 'should clear out all tenants' do
      apartment.add_tenant(jake)
      apartment.add_tenant(chris)
      apartment.remove_all

      expect(apartment.tenants).to eq []
    end
  end
end

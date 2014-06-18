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

  describe '#sq_ft' do
    it 'returns square footage of building' do
      apartment1 = new_apartment
      apartment2 = new_apartment
      apartment3 = new_apartment
      building.add_apartment(apartment1)
      building.add_apartment(apartment2)
      building.add_apartment(apartment3)

      expect(building.sq_ft).to eq 6000
    end
  end

  describe '#revenue' do
    it 'returns rental revenue of building' do
      apartment1 = new_apartment
      apartment2 = new_apartment
      apartment3 = new_apartment
      building.add_apartment(apartment1)
      building.add_apartment(apartment2)
      building.add_apartment(apartment3)

      expect(building.revenue).to eq 3000
    end
  end

  describe '#tenants_list' do
    it 'returns list of tenants in building' do
      apartment1 = new_apartment
      tenant1 = new_tenant
      tenant2 = new_tenant
      tenant2.name = 'Name2'
      apartment1.add_tenant(tenant1)
      apartment1.add_tenant(tenant2)

      apartment2 = new_apartment
      tenant3 = new_tenant
      tenant4 = new_tenant
      tenant3.name = 'Name3'
      tenant4.name = 'Name4'
      apartment2.add_tenant(tenant3)
      apartment2.add_tenant(tenant4)

      building.add_apartment(apartment1)
      building.add_apartment(apartment2)

      expect(building.tenants_list).to match_array ['Name', 'Name2', 'Name3', 'Name4']
    end
  end

  # factory objects
  def new_tenant(name: 'Name', age: 88, credit_score: 800)
    tenant = Tenant.new(name: name, age: age, credit_score: credit_score)
    tenant
  end

  def new_apartment(number: 1, rent: 1000, sq_ft: 2000, num_bedrooms: 2, num_bathrooms: 2)
    apartment = Apartment.new(number: number, rent: rent, sq_ft: sq_ft, num_bedrooms: num_bedrooms, num_bathrooms: num_bathrooms)
    apartment
  end
end

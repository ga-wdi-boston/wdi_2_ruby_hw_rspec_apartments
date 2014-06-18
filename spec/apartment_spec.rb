require_relative '../lib/apartment'

describe Apartment do
  describe 'attributes' do
    it 'has a number, rent, square footage, number of bedrooms, number of bathrooms' do
      expect(new_apartment.number).to eq 1
      expect(new_apartment.rent).to eq 1000
      expect(new_apartment.sq_ft).to eq 2000
      expect(new_apartment.num_bedrooms).to eq 2
      expect(new_apartment.num_bathrooms).to eq 2
      expect(new_apartment.tenants.class).to eq Array
    end
  end

  describe '#add_tenant' do
    it 'adds a tenant to apartment' do
      tenant = new_tenant
      apartment = new_apartment

      apartment.add_tenant(tenant)

      expect(apartment.tenants).to match_array [tenant]
    end

    it 'raises error if tenant has bad credit rating' do
      tenant = new_tenant
      apartment = new_apartment

      tenant.credit_score = 20

      expect{ apartment.add_tenant(tenant) }.to raise_error "Bad credit rating"
      expect(apartment.tenants).to match_array []
    end

    it 'raises error if apartment is full' do
      tenant1 = new_tenant
      tenant2 = new_tenant
      tenant3 = new_tenant
      apartment = new_apartment

      apartment.add_tenant(tenant1)
      apartment.add_tenant(tenant2)

      expect{ apartment.add_tenant(tenant3) }.to raise_error "Apartment full"
      expect(apartment.tenants).to match_array [tenant1, tenant2]
    end
  end

  describe '#remove_tenant' do
    it 'removes a tenant by object from apartment' do
      tenant = new_tenant
      apartment = new_apartment

      apartment.add_tenant(tenant)
      apartment.remove_tenant(tenant)

      expect(apartment.tenants).to eq []
    end

    it 'removes a tenant by name from apartment' do
      tenant = new_tenant
      apartment = new_apartment

      apartment.add_tenant(tenant)
      apartment.remove_tenant(tenant.name)

      expect(apartment.tenants).to eq []
    end

    it 'raises error if tenant not found' do
      tenant = new_tenant
      apartment = new_apartment

      expect{ apartment.remove_tenant(tenant) }.to raise_error "Tenant not found"
    end
  end

  describe '#remove_all' do
    it 'removes all tenants' do
      tenant1 = new_tenant
      tenant2 = new_tenant
      apartment = new_apartment

      apartment.add_tenant(tenant1)
      apartment.add_tenant(tenant2)
      apartment.remove_all

      expect(apartment.tenants).to eq []
    end
  end

  describe '#credit_score' do
    it 'averages the credit score of all tenants' do
      tenant1 = new_tenant
      tenant2 = new_tenant
      tenant2.credit_score = 700
      apartment = new_apartment

      apartment.add_tenant(tenant1)
      apartment.add_tenant(tenant2)

      expect(apartment.credit_score).to eq 750
    end
  end

  describe '#credit_rating' do
    it 'gives credit rating based off apartment credit score' do
      tenant1 = new_tenant
      tenant2 = new_tenant
      tenant2.credit_score = 700
      apartment = new_apartment

      apartment.add_tenant(tenant1)
      apartment.add_tenant(tenant2)

      expect(apartment.credit_rating).to eq 'great'
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

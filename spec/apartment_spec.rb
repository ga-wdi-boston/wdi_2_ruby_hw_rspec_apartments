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
      tenant1 = new_tenant
      apartment1 = new_apartment
      apartment1.add_tenant(tenant1)

      expect(apartment1.tenants).to match_array [tenant1]
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

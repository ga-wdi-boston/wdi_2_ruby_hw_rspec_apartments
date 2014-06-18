require_relative '../lib/apartment'
require_relative '../lib/tenant'


describe Apartment do
  let(:ap) { Apartment.new(
    number: 3,
    rent: 500,
    sq_footage: 501,
    num_of_bedrooms: 2,
    num_of_bathrooms: 1) }

  describe 'attributes' do
    it 'has a number, rent, square footage, number of bedrooms, and number of bathrooms' do
      expect(ap.number).to eq 3
      expect(ap.rent).to eq 500
      expect(ap.sq_footage).to eq 501
      expect(ap.num_of_bedrooms).to eq 2
      expect(ap.num_of_bathrooms).to be 1
    end
  end
  describe '#tenants' do
    it 'has many tenants' do
      expect(ap.tenants).to eq []
    end
  end
  describe '#add_tenant' do
    it 'is able to add a tenant' do
      fred = new_tenant
      ap.add_tenant(fred)
      expect(ap.tenants).to eq [fred]

    end
  end

  def new_tenant(name:'fred', age: 1, credit_score: 700)
    Tenant.new(name: name, age: age, credit_score: credit_score)
  end
end

require_relative '../lib/apartment'
require_relative '../lib/tenant'


describe Apartment do
  let(:ap) { Apartment.new(
    number: 3,
    rent: 500,
    sq_footage: 501,
    num_of_bedrooms: 2,
    num_of_bathrooms: 1)
  }

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
      bad_tenant = new_tenant(credit_score: 3)
      george = new_tenant
      harry = new_tenant
      ap.add_tenant(fred)
      expect(ap.tenants).to eq [fred]
      expect{ ap.add_tenant(bad_tenant) }.to raise_error Apartment::BadCreditError
      ap.add_tenant(george)
      expect{ ap.add_tenant(harry) }.to raise_error Apartment::OverfillError
    end
  end
  describe '#remove_all_tenants' do
    it 'removes all tenants' do
      ap.add_tenant(new_tenant)
      ap.add_tenant(new_tenant)
      ap.remove_all_tenants
      expect(ap.tenants).to eq []
    end
  end
  describe '#average_credit_score' do
    it 'calculates the average credit score of all tenants' do
      tenant_560 = new_tenant(credit_score: 560)
      tenant_724 = new_tenant(credit_score: 724)
      ap.add_tenant(tenant_724)
      ap.add_tenant(tenant_560)
      expect(ap.average_credit_score).to eq 642
      ap.remove_all_tenants
      ap.add_tenant(new_tenant(credit_score:560))
      ap.add_tenant(new_tenant(credit_score:723))
      expect(ap.average_credit_score).to eq 641.5
    end
  end
  describe '#average_credit_rating' do
    it 'calculates the average credit rating from all tenants' do
      tenant_560 = new_tenant(credit_score: 560)
      tenant_724 = new_tenant(credit_score: 724)
      ap.add_tenant(tenant_724)
      ap.add_tenant(tenant_560)
      expect(ap.average_credit_rating).to eq :mediocre
    end
  end


  def new_tenant(name:'fred', age: 1, credit_score: 700)
    Tenant.new(name: name, age: age, credit_score: credit_score)
  end
end

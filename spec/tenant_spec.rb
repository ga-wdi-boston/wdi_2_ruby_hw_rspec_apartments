require_relative '../lib/tenant'

describe Tenant do
  let(:tenant) { Tenant.new('Max Kohl', 25, 730) }

  describe '#initialize' do
    it 'creates a tenant with a name, age, and credit score' do


      expect(tenant.name).to eq 'Max Kohl'
      expect(tenant.age).to eq 25
      expect(tenant.credit_score).to eq 730
    end
  end

  describe '#credit_rating' do
    it 'calculates the credit rating of the tenant' do

      expect(tenant.credit_rating).to eq 'great'
    end
  end
end

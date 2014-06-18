require_relative '../lib/tenant'

describe Tenant do

  describe '#initialize' do
    it 'has name, age and credit score' do
      tenant = Tenant.new('Eric Rho', 26, 700)


      expect(tenant.name).to eq 'Eric Rho'
      expect(tenant.age).to eq 26
      expect(tenant.credit_score).to eq 700
    end
  end

  describe 'credit_rating' do
    it 'categorizes credit rating based on credit score' do
      tenant1 = Tenant.new('Eric', 26, 500)
      tenant2 = Tenant.new('Bob', 50, 700)

      expect(tenant1.credit_rating).to eq 'bad'
      expect(tenant2.credit_rating).to eq 'good'
    end
  end

end

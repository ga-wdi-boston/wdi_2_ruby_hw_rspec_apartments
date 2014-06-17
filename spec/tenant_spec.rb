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

end

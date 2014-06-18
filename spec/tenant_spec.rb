require_relative '../lib/tenant'

describe Tenant do
  describe '#initialize' do
    it 'creates a tenant with a name, age, and credit score' do
      tenant = Tenant.new('Max Kohl', 25, 725)

      expect(tenant.name).to eq 'Max Kohl'
      expect(tenant.age).to eq 25
      expect(tenant.credit_score).to eq 725
      # expect(tene)
    end
  end
end

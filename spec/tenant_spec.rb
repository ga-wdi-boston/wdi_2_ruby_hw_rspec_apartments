require_relative '../lib/tenant'

describe Tenant do
  describe '#initialize' do
    it 'requires a name, age, and credit score' do
      tenant = Tenant.new(name: 'Alex', age: 25, credit_score: 740)

      expect(tenant.name).to eq 'Alex'
      expect(tenant.age).to eq 25
      expect(tenant.credit_score).to eq 740
    end
  end
end

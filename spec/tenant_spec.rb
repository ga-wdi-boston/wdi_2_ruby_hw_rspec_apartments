require_relative '../lib/tenant.rb'

describe Tenant do
  describe '#tenant' do
    it '#initialize' do
      tenant = Tenant.new('Bob',27,800)

      expect(tenant.name).to eq 'Bob'
      expect(tenant.age).to eq 27
      expect(tenant.credit_score).to eq 800
    end
  end
end

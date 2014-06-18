require_relative "../lib/tenant"

describe Tenant do
  describe 'attributes' do
    it 'has a name, age, and a credit score' do
      tenant = Tenant.new("Katryn", 29, 780)

      expect(tenant.name).to eq "Katryn"
      expect(tenant.age).to eq 29
      expect(tenant.credit_score).to eq 780
    end
  end
end


require_relative '../lib/tenant.rb'

describe Tenant do

  describe '#attributes' do
    it 'has a name, age and credit score' do
      tenant1 = Tenant.new('Jodi', 28, 720)

      expect(tenant1.name).to eq 'Jodi'
      expect(tenant1.age).to eq 28
      expect(tenant1.credit_score).to eq 720
    end
  end

end

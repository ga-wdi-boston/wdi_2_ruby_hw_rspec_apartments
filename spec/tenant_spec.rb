require_relative '../lib/tenant.rb'

describe Tenant do
  let(:tenant1) { Tenant.new('Jodi', 28, 720) }

  describe '#attributes' do
    it 'has a name, age and credit score' do

      expect(tenant1.name).to eq 'Jodi'
      expect(tenant1.age).to eq 28
      expect(tenant1.credit_score).to eq 720
    end
  end

  describe '#credit_rating' do
    it 'has a credit rating, calculated from the credit score' do
      expect(tenant1.credit_rating).to eq 'good'
    end
  end

end

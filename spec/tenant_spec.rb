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

  describe '#credit_rating' do
    it 'evaluates the credit rating of the tenant' do
      good_tenant = Tenant.new(name: 'x', age: 30, credit_score: 670)
      bad_tenant = Tenant.new(name: 'y', age: 30, credit_score: 520)

      expect(good_tenant.credit_rating).to eq :good
      expect(bad_tenant.credit_rating).to eq :bad
    end
  end
end

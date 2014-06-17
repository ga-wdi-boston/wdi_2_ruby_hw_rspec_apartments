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
  describe '#credit_rating' do
    it '#check credit score' do
      tenant = Tenant.new('Bob',27,800)
      tenant2 = Tenant.new('Bob',27,725)
      tenant3 = Tenant.new('Bob',27,660)
      tenant4 = Tenant.new('Bob',27,560)
      tenant5 = Tenant.new('Bob',27,500)

      expect(tenant.credit_rating).to eq 'excellent'
      expect(tenant2.credit_rating).to eq 'great'
      expect(tenant3.credit_rating).to eq 'good'
      expect(tenant4.credit_rating).to eq 'mediocre'
      expect(tenant5.credit_rating).to eq 'bad'


    end
  end
end

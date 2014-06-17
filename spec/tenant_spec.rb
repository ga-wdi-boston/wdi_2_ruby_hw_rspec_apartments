# Jake Austin
# WDI Boston June rspec apartments
# June 17, 2014

require_relative '../lib/tenant'

describe Tenant do
  describe '#initialize' do
    it 'should have name, age, and cred' do
      tenant = Tenant.new(name: 'Jake', age: 21, cred: 700)

      expect(tenant.name).to eq 'Jake'
      expect(tenant.age).to eq 21
      expect(tenant.cred).to eq 700
    end
  end
end

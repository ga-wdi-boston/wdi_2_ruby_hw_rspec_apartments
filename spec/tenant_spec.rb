require_relative '../lib/tenant'

describe Tenant do
  describe 'attributes' do
    it 'has a name, age, and credit score' do
      expect(new_tenant.name).to eq 'Name'
      expect(new_tenant.age).to eq 88
      expect(new_tenant.credit_score).to eq 800
    end
  end

  # factory object
  def new_tenant(name: 'Name', age: 88, credit_score: 800)
    tenant = Tenant.new(name: name, age: age, credit_score: credit_score)
    tenant
  end
end

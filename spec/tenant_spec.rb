require_relative '../lib/tenant.rb'
require_relative '../lib/factories.rb'

describe Tenant do

  include Factory

  describe 'attributes' do
    it 'has a name, age, and credit_score' do
      zack = new_tenant
      expect(zack.name).to eq "Zack"
      expect(zack.age).to eq 24
      expect(zack.credit_score).to eq 700
    end
  end

end


require_relative '../lib/tenant'

describe Tenant do
  # has a name, age, and credit score
  describe '#initialize' do
    it 'has a name, age, and credit score' do
      person = Tenant.new(name: "Clara", age: 22, credit_score: 700)

      expect(person.name).to eq "Clara"
      expect(person.age).to eq 22
      expect(person.credit_score).to eq 700

    end

    it 'is using the factory method' do
      expect(new_tenant.name).to eq "bob"
      expect(new_tenant.age).to eq 30
    end

  end

  # has a credit rating calculated from chart
  def new_tenant(name: "bob", age: 30, credit_score: 600)
    tenant = Tenant.new(name: name, age: age, credit_score: credit_score)
  end
end

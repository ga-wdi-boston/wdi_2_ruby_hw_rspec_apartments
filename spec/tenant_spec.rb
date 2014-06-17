require_relative '../lib/tenant'

describe Tenant do
  # has a name, age, and credit score
  describe '#initialize' do
    it 'has a name, age, and credit score' do
      person = Tenant.new("Clara", 22, 700)

      expect(person.name).to eq "Clara"
      expect(person.age).to eq 22
      expect(person.credit_score).to eq 700

    end
  end

  # has a credit rating calculated from chart

end

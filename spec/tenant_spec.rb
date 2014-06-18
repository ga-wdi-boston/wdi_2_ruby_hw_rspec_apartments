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

    it 'works with the factory method' do
      expect(new_tenant.name).to eq "bob"
      expect(new_tenant.age).to eq 30
    end
  end

  # has a credit rating calculated from chart
  describe '#credit_rating' do
    it 'gives the quality of the credit score' do

      bad = new_tenant(credit_score: 500)
      okay = new_tenant(credit_score: 560)
      good = new_tenant(credit_score: 660)
      great = new_tenant(credit_score: 725)
      excellent = new_tenant(credit_score: 760)

      expect(bad.credit_rating).to eq "bad"
      expect(okay.credit_rating).to eq "mediocre"
      expect(good.credit_rating).to eq "good"
      expect(great.credit_rating).to eq "great"
      expect(excellent.credit_rating).to eq "excellent"

    end
  end

  def new_tenant(name: "bob", age: 30, credit_score: 600)
    Tenant.new(name: name, age: age, credit_score: credit_score)
  end
end

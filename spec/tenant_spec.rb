# WDI RSpec Apartment hw
# Blair Caple
# June 17, 2014

require_relative '../lib/tenant'

describe Tenant do
  describe '#initialize' do
    it 'has a name, age and credit score' do
      t = Tenant.new(name: 'John Doe', age: 27, credit_score: 680)
      expect(t.name).to eq 'John Doe'
      expect(t.age).to eq 27
      expect(t.credit_score).to eq 680
    end
  end

  describe '#credit_rating' do
    it 'has a credit rating calculated from the credit score' do
      t = Tenant.new(name: 'John Doe', age: 27, credit_score: 680)
      expect(t.credit_rating).to eq 'good'

      t.credit_score = 500
      expect(t.credit_rating).to eq 'bad'

      t.credit_score = 780
      expect(t.credit_rating).to eq 'excellent'
    end
  end
end

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

  describe 'credit_score' do
    it 'calculates a credit_rating using credit score' do
      excellent = new_tenant(credit_score: 760)
      great = new_tenant(credit_score: 725)
      good = new_tenant(credit_score: 660)
      mediocre = new_tenant(credit_score: 560)
      bad = new_tenant(credit_score: 0)
      expect(excellent.credit_rating).to eq "excellent"
      expect(great.credit_rating).to eq "great"
      expect(good.credit_rating).to eq "good"
      expect(mediocre.credit_rating).to eq "mediocre"
      expect(bad.credit_rating).to eq "bad"
    end
  end

end


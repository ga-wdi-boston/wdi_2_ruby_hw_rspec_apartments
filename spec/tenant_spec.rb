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
    def scored_tenant(credit_score)
      Tenant.new(name: 'x', age: 30, credit_score: credit_score)
    end

    it 'is excellent with a credit score between 760 and 800' do
      expect(scored_tenant(800).credit_rating).to eq :excellent
      expect(scored_tenant(760).credit_rating).to eq :excellent
    end

    it 'is great with a score between 725 and 759' do
      expect(scored_tenant(759).credit_rating).to eq :great
      expect(scored_tenant(725).credit_rating).to eq :great
    end

    it 'is good with a score between 660 and 724' do
      expect(scored_tenant(660).credit_rating).to eq :good
      expect(scored_tenant(724).credit_rating).to eq :good
    end

    it 'is mediocre with a score between 560 and 659' do
      expect(scored_tenant(560).credit_rating).to eq :mediocre
      expect(scored_tenant(659).credit_rating).to eq :mediocre
    end

    it 'is bad with a score between 300 and 559' do
      expect(scored_tenant(300).credit_rating).to eq :bad
      expect(scored_tenant(559).credit_rating).to eq :bad
    end
  end
end

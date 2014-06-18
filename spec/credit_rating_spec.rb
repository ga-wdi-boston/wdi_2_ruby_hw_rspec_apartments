require_relative '../lib/credit_rating'

describe CreditRating do
  describe '.evaluate' do
    it 'is excellent with a score between 760 and 800' do
      expect(CreditRating.evaluate(800)).to eq :excellent
      expect(CreditRating.evaluate(760)).to eq :excellent
    end

    it 'is great with a score between 725 and 759' do
      expect(CreditRating.evaluate(759)).to eq :great
      expect(CreditRating.evaluate(725)).to eq :great
    end

    it 'is good with a score between 660 and 724' do
      expect(CreditRating.evaluate(660)).to eq :good
      expect(CreditRating.evaluate(724)).to eq :good
    end

    it 'is mediocre with a score between 560 and 659' do
      expect(CreditRating.evaluate(560)).to eq :mediocre
      expect(CreditRating.evaluate(659)).to eq :mediocre
    end

    it 'is bad with a score between 300 and 559' do
      expect(CreditRating.evaluate(300)).to eq :bad
      expect(CreditRating.evaluate(559)).to eq :bad
    end
  end
end

require_relative '../lib/tenant'

describe Tenant do
  let(:charlie) {Tenant.new('Charlie', 40, 690)}
  describe 'attributes' do
    it 'assigns name age and credit score to tenant' do
      expect(charlie.name).to eq 'Charlie'
      expect(charlie.age).to eq 40
      expect(charlie.credit_score).to eq 690
    end
  end

  describe '#credit_rating' do
    it 'assigns a creit rating based on score' do
      expect(charlie.credit_rating).to eq 'good'
    end
  end

end

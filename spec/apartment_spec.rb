require_relative '../lib/apartment'

describe Apartment do
  let(:charlie) {Tenant.new('Charlie', 40, 690)}
  let(:mike) {Tenant.new('Mike', 30, 510)}
  let(:paul) {Tenant.new('Paul', 30, 610)}
  let(:donnybrook) {Apartment.new(number: 10, rent: 1500, sq_ft: 3000, bed: 2, bath: 2, tenants: [charlie, mike])}
  let(:harvard) {Apartment.new(number: 10, rent: 1500, sq_ft: 3000, bed: 1, bath: 2, tenants: [])}

  describe 'attributes' do
    it 'assigns instance variables' do
      expect(donnybrook.number).to eq 10
      expect(donnybrook.rent).to eq 1500
      expect(donnybrook.sq_ft).to eq 3000
      expect(donnybrook.bed).to eq 2
      expect(donnybrook.bath).to eq 2
      expect(donnybrook.tenants).to match_array [mike, charlie]
    end
  end

  describe '#add_tenant' do
    it 'adds a tenant if they do not have a bad credit rating or if theres no more room for tenants' do
      harvard.add_tenant(paul)
      expect{harvard.add_tenant(mike)}.to raise_error ArgumentError
      expect{harvard.add_tenant(charlie)}.to raise_error ArgumentError
      expect(harvard.tenants).to eq [paul]
    end
  end

  describe '#remove_tenant' do
    it 'removes tenant or returns an error if tenant not found' do
      donnybrook.remove_tenant(charlie)
      expect(donnybrook.tenants).to eq [mike]
      expect{donnybrook.remove_tenant}.to raise_error ArgumentError
    end
  end

  describe '#remove_all_tenants' do
    it 'removes all tenants' do
      donnybrook.remove_all_tenants
      expect(donnybrook.tenants).to eq []
    end
  end

  describe '#average_credit_score' do
    it 'calculates average_credit_score' do
      expect(donnybrook.average_credit_score).to eq 600
    end
  end

  describe '#credit_rating' do
    it 'calculates the credit rating for the apartment building' do
      expect(donnybrook.credit_rating).to eq 'mediocre'
    end
  end

end

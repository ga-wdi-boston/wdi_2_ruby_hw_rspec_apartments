require_relative '../lib/apartment.rb'
require_relative '../lib/factories.rb'

describe Apartment do
  let(:home) { new_apartment }
  let(:zack) { new_tenant }
  let(:paul) { new_tenant(name: 'Paul') }

  include Factory

  describe 'attributes' do

    it 'has a number, rent, square footage, number of bedrooms, number of bathrooms, and many tenants' do
      expect(home.number).to eq 2
      expect(home.rent).to eq 4400
      expect(home.square_footage).to eq 1000
      expect(home.bedrooms).to eq 4
      expect(home.bathrooms).to eq 2
      expect(home.tenants).to eq []
    end

  end

  describe '#add_tenant' do

    it 'adds tenants' do
      home.add_tenant(zack)
      home.add_tenant(paul)
      expect(home.tenants).to match_array [zack, paul]
    end

    it 'raises an error if the tenant has a bad credit_rating' do
      zack = new_tenant(credit_score: 500)
      expect{ home.add_tenant(zack) }.to raise_error(ArgumentError, 'tenant has insufficient credit rating')
    end

    it 'raises an error if the tenant has a bad credit_rating' do
      home = new_apartment(bedrooms: 0)
      expect{ home.add_tenant(zack) }.to raise_error(ArgumentError, 'apartment is full')
    end
  end

  describe '#evict' do

    it 'removes a tenant by name' do
      home.add_tenant(zack)
      home.evict('zAck')
      expect(home.tenants).to eq []
    end

    it 'removes a tenant by object id' do
      home.add_tenant(zack)
      home.evict(zack.object_id)
      expect(home.tenants).to eq []
    end

    it 'returns an error if tenant not found' do
      home.add_tenant(zack)
      expect { home.evict(paul.object_id) }.to raise_error(ArgumentError, 'could not find tenant with that name/object_id')
    end
  end

  describe '#evict_all' do

    it 'evicts all tenants' do
      home.add_tenant(zack)
      home.add_tenant(paul)
      home.evict_all
      expect(home.tenants).to eq []
    end
  end

  describe '#avg_credit_score' do

    it 'calculates the average credit score of all tenants' do
      home.add_tenant(zack)
      home.add_tenant(new_tenant(credit_score: 600))
      expect(home.avg_credit_score).to eq 650
    end
  end

  describe '#credit_rating' do

    it 'calculates the average credit rating using all tenants credit scores' do
      home.add_tenant(new_tenant(credit_score: 600))
      home.add_tenant(new_tenant(credit_score: 730))
      expect(home.credit_rating).to eq 'good'
    end
  end

end

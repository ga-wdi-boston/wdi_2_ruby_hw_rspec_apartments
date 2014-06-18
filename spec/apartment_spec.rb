require_relative '../lib/apartment.rb'
require_relative '../lib/factories.rb'

describe Apartment do
  let(:home) { new_apartment }
  let(:zack) { new_tenant }

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
      paul = new_tenant
      home.add_tenant(zack)
      home.add_tenant(paul)
      expect(home.tenants).to match_array [zack, paul]
    end

    it 'raises an error if the tenant has a bad credit_rating' do
      zack = new_tenant(credit_score: 500)
      expect{ home.add_tenant(zack) }.to raise_error(ArgumentError)
    end

    it 'raises an error if the tenant has a bad credit_rating' do
      home = new_apartment(bedrooms: 0)
      expect{ home.add_tenant(zack) }.to raise_error(ArgumentError)
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

  end


end

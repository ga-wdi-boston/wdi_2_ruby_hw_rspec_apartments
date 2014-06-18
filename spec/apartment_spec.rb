require_relative '../lib/apartment'

describe Apartment do

  let(:apartment) { Apartment.new(1, 1400, 300, 1, 1) }

  describe 'attributes' do
    it 'accepts a number, rent, square footage, number of bedrooms, and number of bathrooms' do


      expect(apartment.number).to eq 1
      expect(apartment.rent).to eq 1400
      expect(apartment.sq_footage).to eq 300
      expect(apartment.bedrooms).to eq 1
      expect(apartment.bathrooms).to eq 1
      expect(apartment.tenants).to be_an(Array)
      expect(apartment.tenants).to be_empty
    end

    # has a method to add a tenant that raises an error if the tenant has a "bad" credit rating, or if the new tenant count would go over the number of bedrooms
    #describe '#add_tenant' do
      #it 'adds a tenant to the tenants array' do

    #end
  end
end

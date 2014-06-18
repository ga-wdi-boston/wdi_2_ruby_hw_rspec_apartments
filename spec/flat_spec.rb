require_relative '../lib/flat'
require_relative '../lib/tenant'

describe Flat do

  describe '#initialize' do
    it 'has a number, rent, square footage, # of bedrooms and # of bathrooms and number of tenants' do
      tenant1 = Tenant.new('Eric', 26, 500)
      tenant2 = Tenant.new('Ian', 26, 750)
      flat = Flat.new(28, 900, 800, 3, 1, [tenant1, tenant2])

      expect(flat.number).to eq 28
      expect(flat.rent).to eq 900
      expect(flat.sq_ft).to eq 800
      expect(flat.bed).to eq 3
      expect(flat.bath).to eq 1
    end
  end

  describe '#add_tenant' do
    it 'adds a tenant to the flat' do
      flat = Flat.new(28, 900, 800, 3, 1)


      expect(flat.add_tenant('Eric', 26, 700)).to eq flat.tenants

    end
  end

  describe '#add_tenant' do
    it "doesn't add tenant when credit score is too low" do
      apartment = Flat.new(28, 900, 800, 3, 1)
      expect{flat.add_tenant('Eric', 26, 500)}.to raise_error
    end
  end




end

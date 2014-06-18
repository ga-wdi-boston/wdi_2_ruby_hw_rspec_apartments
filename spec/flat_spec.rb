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
      tenant1 = Tenant.new('Eric', 26, 500)
      tenant2 = Tenant.new('Ian', 26, 750)
      flat = Flat.new(28, 900, 800, 3, 1)

      flat.add_tenant('Eric', 26, 700)
      flat.add_tenant('Ian', 24, 500)

      expect(flat.tenants[0].name).to eq 'Eric'
      expect(flat.tenants[0].age).to eq 26
      expect(flat.tenants[0].credit_score).to eq 700
      expect(flat.tenants[1].name).to eq 'Ian'
      expect(flat.tenants[1].age).to eq 24
      expect(flat.tenants[1].credit_score).to eq 500
    end
  end


end

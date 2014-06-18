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
      flat = Flat.new(28, 900, 800, 3, 1)
      expect{flat.add_tenant('Eric', 26, 500)}.to raise_error
    end
  end

  describe '#add_tenant' do
    it "doesn't add tenant when bedrooms are full" do
      flat = Flat.new(28, 900, 800, 3, 1)
      flat.add_tenant('Eric', 26, 700)
      flat.add_tenant('Ian', 24, 750)
      flat.add_tenant('Euan', 24, 720)

      expect{flat.add_tenant('Bro', 50, 650)}.to raise_error

    end
  end

  describe '#rem_tenant' do
    it 'removes tenant from the flat' do
      flat = Flat.new(28, 900, 800, 3, 1)
      flat.add_tenant('Eric', 25, 700)
      # flat.add_tenant('Ian', 24, 750)
      # flat.add_tenant('Euan', 24, 720)

      expect(flat.rem_tenant('Eric')).to eq []

    end
  end

  describe '#clear_tenants'do
    it 'removes all tenants from the flat' do
      flat = Flat.new(28, 900, 800, 3, 1)
      flat.add_tenant('Eric', 26, 770)
      flat.add_tenant('Ian', 24, 700)
      flat.add_tenant('Euan', 24, 800)

      expect(flat.clear_tenants).to eq []
    end
  end




end

require_relative '../lib/apartment.rb'

describe Apartment do
  describe 'attributes' do
    it 'create apartments' do
    tenant = Tenant.new('Bob',27,800)
    tenant2 = Tenant.new('Bob',27,725)
    apartment = Apartment.new(101,900,50,3,1,[tenant,tenant2])

    expect(apartment.number).to eq 101
    expect(apartment.rent).to eq 900
    expect(apartment.square_footage).to eq 50
    expect(apartment.room).to eq 3
    expect(apartment.bath).to eq 1
    end
  end

  describe '#add_tenant' do
    it 'adds tenant to apartment' do
      apartment = Apartment.new(101,900,50,3,1)

      expect(apartment.add_tenant('Bob',27,800)).to eq apartment.tenants
      expect(apartment.add_tenant('Nick',27,725)).to eq apartment.tenants

    end
  end

  describe '#add_tenant' do
    it 'dont add tenant to apartment when credit = bad' do
      apartment = Apartment.new(101,900,50,3,1)
      expect{apartment.add_tenant('Bob',27,300)}.to raise_error
    end
  end

  describe '#add_tenant' do
    it 'dont add tenant when tenants # exceed bedroom # ' do
      apartment = Apartment.new(101,900,50,3,1)
      apartment.add_tenant('Bob',27,900)
      apartment.add_tenant('Tob',27,900)
      apartment.add_tenant('Mob',27,900)
      expect{apartment.add_tenant('Fob',27,900)}.to raise_error
    end
  end

  describe '#delete_tenant' do
    it 'delete tenant' do
      apartment = Apartment.new(101,900,50,3,1)
      apartment.add_tenant('Bob',27,900)
      expect(apartment.delete_tenant('Bob')).to eq []
    end
  end
  describe '#clear_tenant' do
    it 'clear tenant' do
      apartment = Apartment.new(101,900,50,3,1)
      apartment.add_tenant('Bob',27,900)
      apartment.add_tenant('Bob',27,900)
      expect(apartment.clear_tenant).to eq []
    end
  end

  describe '#avg_credit' do
    it 'calculate average credit_score' do
      apartment = Apartment.new(101,900,50,3,1)
      apartment.add_tenant('Bob',27,800)
      apartment.add_tenant('Bob',27,900)
      apartment.add_tenant('Bob',27,700)
      expect(apartment.avg_credit).to eq 800
    end
  end

  describe '#credit_rating' do
    it 'calculate average credit_score' do
      apartment = Apartment.new(101,900,50,3,1)
      apartment.add_tenant('Bob',27,800)
      apartment.add_tenant('Bob',27,900)
      apartment.add_tenant('Bob',27,700)
      expect(apartment.credit_rating).to eq 'excellent'
    end
  end

end

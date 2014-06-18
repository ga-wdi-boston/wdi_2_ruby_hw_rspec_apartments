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
  # describe '#add_tenant' do
  #   it 'dont add tenat to apartment when credit = bad' do
  #     apartment = Apartment.new(101,900,50,3,1)




  #     expect(apartment.add_tenant('Bob',27,300))

  #   end
  # end
end

# WDI RSpec Apartment hw
# Blair Caple
# June 17, 2014

require_relative '../lib/apartment'

describe Apartment do
  describe '#initialize' do
    it 'has a number, square footage, number of bedrooms and number of bathrooms' do
      apt = create_apartment

      expect(apt.number).to eq 999
      expect(apt.rent).to eq 1200
      expect(apt.area).to eq 1100
      expect(apt.bedrooms).to eq 3
      expect(apt.baths).to eq 2
    end
  end

  describe '#tenants' do
    it 'has many tenants' do
      apt = create_apartment

      expect(apt.tenants).to eq []
    end

    it 'the list of tenants should not be modified directly' do
      apt = create_apartment
      tenants = apt.tenants
      tenants << create_tenant(name: 'Joe Shmoe', age: 28, credit_score: 550)

      expect(tenants.size).not_to eq apt.tenants.size
    end
  end

  describe '#add_tenant' do
    it 'has a method to add a tenant' do
      apt = create_apartment
      apt.add_tenant(create_tenant)

      expect(apt.tenants.size).to eq 1
    end

    it 'raises an error if the tenant has a bad credit rating' do
      apt = create_apartment
      t = create_tenant
      t.credit_score = 500

      expect{ apt.add_tenant(t) }.to raise_error Apartment::BadCreditRatingError if t.credit_rating == 'bad'
    end

    it 'raises an error if the new tenant count would go over the number of bedrooms' do
      apt = create_apartment(bedrooms: 1)
      apt.add_tenant(create_tenant(name: 'Joe Schmoe'))
      new_tenant = create_tenant(name: 'John Doe')

      expect{ apt.add_tenant(new_tenant) }.to raise_error ArgumentError if (apt.tenants.size + 1) > apt.bedrooms
    end
  end

  describe '#evict' do
    it 'has a methd to remove a specific tenant by object reference or name' do
      apt = create_apartment
      t = create_tenant

      apt.add_tenant(t)
      expect(apt.evict(t)).to eq t

      apt.add_tenant(t)
      expect(apt.evict('John Doe')).to eq t
    end

    it 'raises an error if the tenant is not found' do
      apt = create_apartment
      apt.add_tenant(create_tenant)

      expect{ apt.evict('Jane Doe') }.to raise_error Apartment::TenantNotFoundError
    end
  end

  describe '#evict_all' do
    it 'has a method that removes all tenants' do
      apt = create_apartment
      apt.add_tenant(create_tenant(name: 'John Doe'))
      apt.add_tenant(create_tenant(name: 'Bob Smith'))

      expect(apt.evict_all).to eq true
    end
  end

  describe '#credit_score' do
    it 'has an average credit score, calculated from all tenants' do
      apt = create_apartment
      apt.add_tenant(create_tenant(credit_score: 600))
      apt.add_tenant(create_tenant(credit_score: 620))

      expect(apt.credit_score).to eq 610
    end
  end

  describe '#credit_rating' do
    it 'has a credit rating calculated from the average credit score' do
      apt = create_apartment
      apt.add_tenant(create_tenant(credit_score: 650))
      apt.add_tenant(create_tenant(credit_score: 700))

      expect(apt.credit_rating).to eq 'good'
    end
  end

  def create_apartment(number: 999, rent: 1200, area: 1100, bedrooms: 3, baths: 2)
    Apartment.new(number: number, rent: rent, area: area, bedrooms: bedrooms, baths: baths)
  end

  def create_tenant(name: 'John Doe', age: 27, credit_score: 580)
    Tenant.new(name: name, age: age, credit_score: credit_score)
  end
end

require_relative '../lib/apartment'
require_relative '../lib/tenant'

describe Apartment do

  describe '#initialize' do
    it 'has number, rent, sq_ft, bedrooms, and bathrooms' do
      apt = Apartment.new(number: 55, rent: 675, sq_ft: 300, beds: 3, baths: 1)
      expect(apt.number).to eq 55
      expect(apt.rent).to eq 675
      expect(apt.sq_ft).to eq 300
      expect(apt.beds).to eq 3
      expect(apt.baths).to eq 1
    end
  end

  # has tenants
  describe '#tenants' do
    it 'could have tenants' do
      expect(new_apt.tenants)
    end

    # the list of tenants cannot be modified directly
    it 'cannot modify tenants directly' do
      expect{ new_apt.tenants = 4 }.to raise_error
    end
  end

  # has method to add tenant
  describe '#add_tenant' do
    it 'has a method to add tenants' do
      expect(new_apt.add_tenant(new_tenant))
    end

    it 'puts new tenant into tenants list' do
      apt = new_apt(beds: 3)
      person1 = new_tenant
      person2 = new_tenant
      person3 = new_tenant

      apt.add_tenant(person1)
      apt.add_tenant(person2)
      apt.add_tenant(person3)

      expect(apt.tenants).to contain_exactly(person1, person2, person3)
    end

    it 'doesnt let you add tenant with bad credit rating' do
      not_tenant = new_tenant(credit_score: 300)
      expect{ new_apt.add_tenant(not_tenant) }.to raise_error
    end

    # returns an error if the apartment is full
    it 'stops new tenants if the apartment is full' do
      apt = new_apt(beds: 3)
      3.times do
        apt.add_tenant(new_tenant)
      end
      expect{ apt.add_tenant(new_tenant) }.to raise_error
    end

  end

  # has method to remove specific tenant (by reference or by name)
  describe '#remove_tenant' do
    it 'removes a tenant by name' do
      apt = new_apt
      apt.add_tenant(new_tenant(name: "john"))
      apt.add_tenant(new_tenant(name: "mary"))

      apt.remove_tenant(name: "john")

      expect(apt.tenants.length).to eq 1
      expect(apt.tenants[0].name).to eq "mary"
    end

    it 'removes a tenant by object reference' do
      apt = new_apt
      joe = new_tenant(name: "joe")
      susan = new_tenant(name: "susan")
      apt.add_tenant(joe)
      apt.add_tenant(susan)

      apt.remove_tenant(obj: susan)

      expect(apt.tenants.length).to eq 1
      expect(apt.tenants[0].name).to eq "joe"
    end

    it 'returns an error if there is no such person' do
      apt = new_apt
      joe = new_tenant(name: "joe")
      susan = new_tenant(name: "susan")
      apt.add_tenant(joe)
      apt.add_tenant(susan)

      expect{ apt.remove_tenant(obj: mary) }.to raise_error
      expect{ apt.remove_tenant(name: "robert") }.to raise_error
    end

  end

  # has method that evicts everybody

  # has average credit score
  # has credit rating


  def new_apt(number: 9.75, rent: 1000, sq_ft: 400, beds: 2, baths: 1, add_bob: false)
    room = Apartment.new(number: number, rent: rent, sq_ft: sq_ft, beds: beds, baths: baths)
    room.add_tenant(new_tenant) if add_bob == true
    room
  end
  def new_tenant(name: "bob", age: 30, credit_score: 600)
    Tenant.new(name: name, age: age, credit_score: credit_score)
  end

end

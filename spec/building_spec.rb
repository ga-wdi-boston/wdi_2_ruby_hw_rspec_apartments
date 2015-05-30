# WDI RSpec Apartment hw
# Blair Caple
# June 17, 2014

require_relative '../lib/building'

describe Building do
  describe '#initialize' do
    it 'has an address' do
      b = create_building

      expect(b.address).to eq '299 Elm Street'
    end

    it 'has many apartments' do
      b = create_building

      expect(b.apartments.size).to eq 0
    end
  end

  describe '#apartments' do
    it 'the list of apartments should not be modified directly' do
      b = create_building
      b.add_apartment(create_apartment)
      apartments = b.apartments
      apartments << create_apartment(number: 34)

      expect(apartments.size).to_not eq b.apartment_count
    end
  end

  describe '#add_apartment' do
    it 'has a method to add an apartment' do
      b = create_building

      expect(b.add_apartment(create_apartment)).to eq true
    end
  end

  describe '#remove_apartment' do
    it 'has a method to remove a spceific apartment by its number' do
      b = create_building
      b.add_apartment(create_apartment(number: 239))

      expect(b.remove_apartment(239)).to eq true
    end

    it 'raises an error if the number is not found' do
      b = create_building
      b.add_apartment(create_apartment(number: 239))

      expect{ b.remove_apartment(112) }.to raise_error Building::ApartmentNotFoundError
    end

    it 'raises an error if the apartment currently has any tenants' do
      a = create_apartment(number: 239)
      a.add_tenant(create_tenant(name: 'John Doe'))
      a.add_tenant(create_tenant(name: 'Bob Smith'))

      b = create_building
      b.add_apartment(a)

      expect{ b.remove_apartment(239)}.to raise_error Building::ApartmentOccupiedError
    end

    it 'will not raise an error if constaint is overridden' do
      a = create_apartment(number: 239)
      a.add_tenant(create_tenant(name: 'John Doe'))
      a.add_tenant(create_tenant(name: 'Bob Smith'))
      b = create_building
      b.add_apartment(a)

      expect(b.remove_apartment(239, :evict)).to eq true
    end
  end

  describe '#rental_area' do
    it 'has a toatl square footage calculated from all apartments' do
      b = create_building
      b.add_apartment(create_apartment(area: 1200))
      b.add_apartment(create_apartment(area: 1100))

      expect(b.rental_area).to eq 2300
    end
  end

  describe '#monthly_revenue' do
    it 'has a total monthly revenue, calculated from all apartment rents' do
      b = create_building
      b.add_apartment(create_apartment(rent: 1200))
      b.add_apartment(create_apartment(rent: 1100))

      expect(b.monthly_revenue).to eq 2300
    end
  end

  describe '#tenants' do
    it 'has a list of tenants, pulled from the tenant lists of all apartments' do
      t1 = create_tenant(name: 'John Doe')
      t2 = create_tenant(name: 'Bob Smith')
      t3 = create_tenant(name: 'Jane Doe')
      t4 = create_tenant(name: 'Mary Smith')

      a1 = create_apartment(number: 239)
      a1.add_tenant(t1)
      a1.add_tenant(t2)

      a2 = create_apartment(number: 339)
      a2.add_tenant(t3)
      a2.add_tenant(t4)

      b = create_building
      b.add_apartment(a1)
      b.add_apartment(a2)

      expect(b.tenants).to eq [t1, t2, t3, t4]
    end
  end

  describe '#group_apartments' do
    it 'has a method to retrieve all apartments grouped by credit rating' do
      t1 = create_tenant(name: 'John Doe', credit_score: 600)
      t2 = create_tenant(name: 'Bob Smith', credit_score: 560)
      t3 = create_tenant(name: 'Jane Doe', credit_score: 750)
      t4 = create_tenant(name: 'Mary Smith', credit_score: 730)

      a1 = create_apartment(number: 239)
      a1.add_tenant(t1)
      a1.add_tenant(t2)

      a2 = create_apartment(number: 339)
      a2.add_tenant(t3)
      a2.add_tenant(t4)

      b = create_building
      b.add_apartment(a1)
      b.add_apartment(a2)

      r = [['great', [a2]], ['mediocre', [a1]]]

      expect(b.group_apartments).to eq r
    end
  end

  def create_building(address: '299 Elm Street')
    Building.new(address: address)
  end

  def create_apartment(number: 999, rent: 1200, area: 1100, bedrooms: 3, baths: 2)
    Apartment.new(number: number, rent: rent, area: area, bedrooms: bedrooms, baths: baths)
  end

  def create_tenant(name: 'John Doe', age: 27, credit_score: 580)
    Tenant.new(name: name, age: age, credit_score: credit_score)
  end
end

require_relative '../lib/apartment'

describe Apartment do
  describe '#initialize' do
    it "has num, rent, sq footage, num bedrooms, num bathrooms, many tenants" do
      apartment = Apartment.new(number: 25, sq_footage: 2500, num_bedrooms: 50, num_bathrooms: 50, rent: 50000 )

      expect(apartment.rent).to eq 50000
    end
  end

    describe '#add_tenant' do
      it "raises an error if the tenant has a bad credit rating, or if the new tenant count would go over the number of bedrooms" do
        al = Tenant.new(name: "Al", age: 20, credit_score: 500)
        apt1 = Apartment.new(number: 25, sq_footage: 2500, num_bedrooms: 50, num_bathrooms: 50, rent: 50000 )

        apt1.add_tenant(al)
        expect{ Apartment.new('Al', []) }.to raise_error

        joe = Tenant.new(name: 'Joe', age: 50, credit_score: 800)
        apt2 = Apartment.new(number: 25, sq_footage: 2500, num_bedrooms: 0, num_bathrooms: 50, rent: 50000 )
        apt2.add_tenant(joe)

        # #expect(apt2.add_tenant(joe)).to raise_error
        # #expect{ Apartment.new('Joe', []) }.to raise_error
        expect{apt2.add_tenant(joe) }.to raise_error
      end
    end

    describe "#remove_all_tenants" do
      it 'removes all tenants' do
        al = Tenant.new(name: "Al", age: 20, credit_score: 800)
        apt1 = Apartment.new(number: 25, sq_footage: 2500, num_bedrooms: 50, num_bathrooms: 50, rent: 50000 )
        apt1.add_tenant(al)
        apt1.remove_all_tenants

        expect(apt1.remove_all_tenants).to eq []
      end
    end



    describe '#credit_rating' do
      it "calculates from the credit score" do
        tenant= Tenant.new(name: "Al", age: 88, credit_score: 500)

        expect(tenant.credit_rating).to eq 'bad'

        tenant= Tenant.new(name: "Al", age: 88, credit_score: 800)
        expect(tenant.credit_rating).to eq 'excellent'
      end
    end

    describe '#credit_score' do
      it "calculates tbe average credit_score" do

      apt1 = Apartment.new(number: 25, sq_footage: 2500, num_bedrooms: 50, num_bathrooms: 50, rent: 50000 )

      al = Tenant.new(name: "Al", age: 20, credit_score: 800)
      dave = Tenant.new(name: "Dave", age: 30, credit_score: 600)
      john = Tenant.new(name: "John", age: 40, credit_score: 700)

      apt1.add_tenant(al)
      apt1.add_tenant(dave)
      apt1.add_tenant(john)

      expect { Apartment.new(apt1, []).credit_score }.to eq 700
    end
  end
end


# Apartment

# has a number, rent, square footage, number of bedrooms, and number of bathrooms
# has many tenants
# the list of tenants should not be modified directly
# (bonus: actually prevent it from being modified directly)
# has a method to add a tenant that raises an error if the tenant has a "bad" credit rating,
# or if the new tenant count would go over the number of bedrooms
# has a method to remove a specific tenant either by object reference or by name
#(bonus: do this without checking classes), which raises an error if the tenant is not found

# has a method that removes all tenants
# has an average credit score, calculated from all tenants
# has a credit rating, calculated from the average credit score using the logic below


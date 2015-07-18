require_relative '../lib/tenant'

describe Tenant do
  describe '#initialize' do
    it "has name, age, credit score" do
      tenant = Tenant.new(name: "Al", age: 88, credit_score: 500)


      expect(tenant.name).to eq 'Al'
      expect(tenant.age).to eq 88
      expect(tenant.credit_score).to eq 500
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

end


# has a name, age, and credit score
# has a credit rating, calculated from the credit score as follows:
# 760 or higher is "excellent"
# 725 or higher is "great"
# 660 or higher is "good"
# 560 or higher is "mediocre"
# anything lower is "bad"

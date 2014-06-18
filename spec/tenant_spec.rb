require_relative '../lib/tenant'

describe Tenant do

  let(:tenant) { new_tenant }
  describe 'attributes' do
    it 'has name, age, and credit_score' do

      expect(tenant.name).to eq 'fred'
      expect(tenant.age).to eq 1
      expect(tenant.credit_score).to eq 700
    end

    describe '#credit_rating' do
      it 'has a credit rating, calculated from score' do
        ex_tenant = new_tenant(credit_score: 760)
        great_tenant = new_tenant(credit_score: 725)
        good_tenant = new_tenant(credit_score: 660)
        med_tenant = new_tenant(credit_score: 560)
        bad_tenant = new_tenant(credit_score: 559)

        expect(ex_tenant.credit_rating).to eq :excellent
        expect(great_tenant.credit_rating).to eq :great
        expect(good_tenant.credit_rating).to eq :good
        expect(med_tenant.credit_rating).to eq :mediocre
        expect(bad_tenant.credit_rating).to eq :bad
      end
    end
  end

  def new_tenant(name:'fred', age: 1, credit_score: 700)
    Tenant.new(name: name, age: age, credit_score: credit_score)
  end
end


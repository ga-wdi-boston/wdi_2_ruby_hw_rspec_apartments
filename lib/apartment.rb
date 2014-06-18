# Apartment.new(
    # number: number,
    # rent: rent,
    # sq_footage: sq_footage,
    # num_of_bedrooms: num_of_bedrooms,
    # num_of_bathrooms: num_of_bathrooms) }
class Apartment
  attr_reader :number, :rent, :sq_footage, :num_of_bedrooms, :num_of_bathrooms, :tenants

  def initialize(
    number: number,
    rent: rent,
    sq_footage: sq_footage,
    num_of_bedrooms: num_of_bedrooms,
    num_of_bathrooms: num_of_bathrooms)

    @number, @rent, @sq_footage, @num_of_bedrooms, @num_of_bathrooms, @tenants =
      number, rent, sq_footage, num_of_bedrooms, num_of_bathrooms, []

  end

    def add_tenant(tenant)
      raise BadCreditError if tenant.credit_rating == :bad
      raise OverfillError if tenants.count >= num_of_bedrooms
      @tenants += [tenant]
    end

    def remove_all_tenants
      @tenants = []
    end

    def average_credit_score
      sum = tenants.map(&:credit_score).reduce(0, &:+)
      sum.to_f / tenants.count
    end

    def average_credit_rating
      Tenant.credit_rating_from_score(average_credit_score)
    end

    class BadCreditError < StandardError; end
    class OverfillError < StandardError; end
end

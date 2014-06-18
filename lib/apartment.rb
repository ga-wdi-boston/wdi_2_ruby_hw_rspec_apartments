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

    class BadCreditError < StandardError; end
    class OverfillError < StandardError; end
end

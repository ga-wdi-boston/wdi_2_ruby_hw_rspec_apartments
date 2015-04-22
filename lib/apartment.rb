require_relative 'credit_rating_chart.rb'

class Apartment

  include CreditConversion

  attr_reader :number, :rent, :square_footage, :bedrooms, :bathrooms
  attr_accessor :tenants

  def initialize (number:, rent:, square_footage:, bedrooms:, bathrooms:)
    @number, @rent, @square_footage, @bedrooms, @bathrooms = number, rent, square_footage, bedrooms, bathrooms
    @tenants = []
  end

  def add_tenant(tenant)
    raise ArgumentError, 'tenant has insufficient credit rating' if tenant.credit_rating == 'bad'
    raise ArgumentError, 'apartment is full' if tenants.length == self.bedrooms
    self.tenants << tenant
  end

  def evict(tenant)
    candidate = tenants.find { |i| i.name.casecmp(tenant) } if tenant.class == String
    candidate = tenants.find { |i| i.object_id == tenant } if tenant.class == Fixnum
    if !tenants.delete(candidate)
      raise ArgumentError, 'could not find tenant with that name/object_id'
    end
  end

  def evict_all
    self.tenants = []
  end

  def avg_credit_score
    tenants.map(&:credit_score).reduce(0, &:+) / tenants.length
  end

  def credit_rating
    CREDIT_RATINGS.each { |rating, score| return rating.to_s if avg_credit_score >= score }
    "bad"
  end

end

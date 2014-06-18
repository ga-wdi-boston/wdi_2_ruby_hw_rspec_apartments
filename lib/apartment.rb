# WDI RSpec Apartment hw
# Blair Caple
# June 17, 2014

require 'set'

class Apartment
  class BadCreditRatingError < RuntimeError; end
  class TenantNotFoundError < ArgumentError; end

  attr_reader :number, :area
  attr_accessor :rent, :bedrooms, :baths

  def initialize(number: number, rent: rent, area: area, bedrooms: bedrooms, baths: baths)
    @number, @rent, @area, @bedrooms, @baths = number, rent, area, bedrooms, baths
    @tenants = Set.new()
  end

  def tenants
    result = []
    @tenants.each { |e| result << e }
    result
  end

  def add_tenant(t)
    raise ArgumentError if (@tenants.size + 1) > bedrooms
    raise BadCreditRatingError if t.credit_rating == 'bad'
    result = @tenants.add(t)
    result
  end

  def evict(v)
    evicted = nil
    @tenants.reject! { |e| evicted = e if (e == v || e.name == v) }
    raise TenantNotFoundError if evicted.nil?
    evicted
  end

  def evict_all
    @tenants.clear
    true
  end

  def credit_score
    @tenants.map { |e| e.credit_score }.reduce(0, &:+) / @tenants.size
  end

  def credit_rating
    score = credit_score
    Tenant::CREDIT_RATINGS.each { |k, v| return v if score >= k }
  end
end

# WDI RSpec Apartment hw
# Blair Caple
# June 17, 2014

require 'set'

class Building
  class ApartmentNotFoundError < RuntimeError; end
  class ApartmentOccupiedError < RuntimeError; end

  attr_reader :address

  def initialize(address: address)
    @address = address
    @apartments = Set.new
  end

  def apartments
    result = Array.new(0)
    @apartments.each { |e| result << e }
    result
  end

  def apartment_count
    @apartments.size
  end

  def add_apartment(a)
    success = @apartments.add?(a)
    return true if success
    false
  end

  def remove_apartment(number, evict = false)
    result = @apartments.reject! do |e|
      raise ApartmentOccupiedError if (e.number == number && !e.tenants.empty? && !evict)
      e.number == number
    end
    raise ApartmentNotFoundError if result.nil?
    true
  end

  def rental_area
    @apartments.map { |e| e.area }.reduce(0, &:+)
  end

  def monthly_revenue
    @apartments.map { |e| e.rent }.reduce(0, &:+)
  end

  def tenants
    result = []
    @apartments.each { |e| result << e.tenants }
    result.flatten
  end

  def group_apartments
    @apartments.group_by { |e| e.credit_rating }.sort
  end
end

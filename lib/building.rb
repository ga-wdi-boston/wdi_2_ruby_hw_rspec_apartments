# Jake Austin
# WDI Boston June rspec apartments
# June 17, 2014
 require_relative 'apartment'

class Building

  attr_reader :address, :apartments

  def initialize(address:)
    @address = address
    @apartments = []
  end

  def add_appt(appt:)
    @apartments << appt
  end

  def remove_appt(num:, evict: false)
    if apartments.select {|appt| appt.number == num}.empty?
      raise "Apartment number not recognized"
    else
      success = apartments.reject!{ |appt| appt.number == num && (appt.tenants.empty? || evict)}
      raise 'You must evict to remove this apartment' unless success
    end
  end

  def sq_footage
    apartments.map{|appt| appt.sq_feet}.reduce(0, &:+)
  end

  def monthly_revenue
    apartments.map{|appt| appt.rent}.reduce(0, &:+)
  end

  def tenants
    all = []
    apartments.map {|appt| all.concat(appt.tenants) }
    all
  end
end

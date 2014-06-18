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

end

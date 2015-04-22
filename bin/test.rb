require_relative '../lib/apartment'
require_relative '../lib/tenant'
require 'pry'


ap = Apartment.new(
    number: 3,
    rent: 500,
    sq_footage: 501,
    num_of_bedrooms: 2,
    num_of_bathrooms: 1)
binding.pry

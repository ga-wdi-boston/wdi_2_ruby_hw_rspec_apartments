require_relative '../lib/flat'
require_relative '../lib/tenant'

describe Flat do
  describe '#initialize' do
    it 'has a number, rent, square footage, # of bedrooms and # of bathrooms' do
      flat = Flat.new(28, 900, 800, 3, 1)

      expect(flat.number).to eq 28
      expect(flat.rent).to eq 900
      expect(flat.sq_ft).to eq 800
      expect(flat.bed).to eq 3
      expect(flat.bath).to eq 1
    end
  end

end

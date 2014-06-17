require_relative '../lib/apartment.rb'

describe Apartment do
  describe 'attributes' do
    it 'create apartments' do
    apartment = Apartment.new(101,900,50,3,1)

    expect(apartment.number).to eq 101
    expect(apartment.rent).to eq 900
    expect(apartment.square_footage).to eq 50
    expect(apartment.room).to eq 3
    expect(apartment.bath).to eq 1
    end
  end
end

class Building
  attr_reader :address, :apartments

  def initialize(address:)
    @address = address
    @apartments = []
  end

  def add_apartment(apartment)
    apartments << apartment
  end

  def remove_apartment(number)
    apartments.delete_if { |apartment| apartment.number == number }
  end

  def sq_ft
    apartments.map(&:sq_ft).reduce(0, &:+)
  end

  def revenue
    apartments.map(&:rent).reduce(0, &:+)
  end

  def tenants_list
    apartments.map(&:tenants).flatten.map(&:name).uniq
  end

  def apartments_by_credit_rating
    apartments.group_by(&:credit_rating)
  end
end

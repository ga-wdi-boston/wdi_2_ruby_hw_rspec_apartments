class Flat

attr_accessor :number, :rent, :sq_ft, :bed, :bath, :tenants

  def initialize(number, rent, sq_ft, bed, bath, tenants = [])
    @number = number
    @rent = rent
    @sq_ft = sq_ft
    @bed = bed
    @bath = bath
    @tenants = []
  end

  def add_tenant(name, age, credit_score)
    tenants << Tenant.new(name, age, credit_score)
  end
end

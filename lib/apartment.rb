class Apartment
  attr_reader :number, :rent, :sq_ft, :bed, :bath, :tenants

  def initialize(number:, rent:, sq_ft:, bed:, bath:, tenants:)
    @number, @rent, @sq_ft, @bed, @bath, @tenants = number, rent, sq_ft, bed, bath, tenants
  end

  def add_tenant(tenant)
    if tenant.credit_rating != 'bad' && (self.bed - tenants.count) > 0
      tenants << tenant
      #elsif tenant.credit_rating == 'bad'
      #raise StandardError.new('Cannot add tenant due to bad credit rating')
    else
      #raise StandardError.new('Not enough room for tenant')
      raise ArgumentError, 'Cannot add tenant'
    end
  end

  def remove_tenant(tenant)
    if tenants.include?(tenant)
      tenants.delete(tenant)
    else
      raise ArgumentError, 'Tenant not found'
    end
  end

  def remove_all_tenants
    tenants.clear
  end

  def average_credit_score
    tenants.map(&:credit_score).reduce(0,:+) / tenants.count
  end

  def credit_rating
    if average_credit_score >= 760
      'excellent'
    elsif average_credit_score >= 725
      'great'
    elsif average_credit_score >= 660
      'good'
    elsif average_credit_score >= 560
      'mediocre'
    else
      'bad'
    end
  end

end

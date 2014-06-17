require_relative "../lib/tenant.rb"

module Factory

  def new_tenant(name: "Zack", age: 24, credit_score: 700)
    Tenant.new(name: name, age: age, credit_score: credit_score)
  end

end

module CreditRating

  def credit_rating
    case self.credit_score
    when nil
      nil
    when (0...560)
      "bad"
    when (560...660)
      "mediocre"
    when (660...725)
      "good"
    when (725...760)
      "great"
    else
      "excellent"
    end
  end

end

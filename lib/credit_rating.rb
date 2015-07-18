module CreditRating
  CREDIT_RATINGS = { 760 => 'excellent', 725 => 'great', 660 => 'good', 560 => 'mediocre', 0 => 'bad'}

  def credit_rating
    CREDIT_RATINGS.each { |score, rating| return rating if credit_score >= score }
  end

end

module Price
  MARKUP = 0.7
  # Convert cost to price with 30% Markup
  def self.with_markup(cost)
    (cost / MARKUP).round(2)
  end
end
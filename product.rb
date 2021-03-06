#  Calculates final cost for products for sale
class Product

  FLAT_MARKUP = 5
  WORKER_MARKUP = 1.2
  CATEGORIES_MARKUP = { food: 13, electronics: 2, drugs: 7.5 }
  SYNONYMS = { pharmaceuticals: 'drugs' }

  def self.final_cost(base_price: 0.0, workers: 0, category: '')
    # validate arguments
    raise(ArgumentError, 'Argument base_price is not strictly positive') unless base_price.is_a?(Numeric) && base_price > 0
    raise(ArgumentError, 'Argument workers is not a positive number integer') unless workers.is_a?(Integer) && workers >= 0 
    raise(ArgumentError, 'Argument category is not a string') unless category.is_a?(String)

    cost = add_markup(base_price, FLAT_MARKUP)

    # see if category supplied is actually a synonym, if so, get the category
    category = SYNONYMS[category.to_sym] || category
    additional_markup = WORKER_MARKUP * workers + (CATEGORIES_MARKUP[category.to_sym] || 0)
    cost = add_markup(cost, additional_markup) if additional_markup > 0
    round_cents(cost)
  end

  private

  def self.add_markup(price, markup)
    price * (markup + 100) / 100
  end

  def self.round_cents(price)
    (price * 100).round / 100.0
  end
end

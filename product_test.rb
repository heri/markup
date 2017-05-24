require_relative 'product'
require 'test/unit'

# tests final cost calculations based on based price,
# number of people working and product category
class TestMarkup < Test::Unit::TestCase
  def test_base_examples
    assert_equal 1_591.58, Product.final_cost(base_price: 1_299.99, workers: 3, category: 'food')
    assert_equal 6_199.81, Product.final_cost(base_price: 5_432.00, workers: 1, category: 'drugs')
    assert_equal 13_707.63, Product.final_cost(base_price: 12_456.95, workers: 4, category: 'books')
  end

  def test_electronics
    assert_equal 1_392.29, Product.final_cost(base_price: 1_299.99, workers: 0, category: 'electronics')
  end

  def test_only_flat
    # this assumes no workers and no category
    # it should only apply the 5% flat markup
    assert_equal 1_364.99, Product.final_cost(base_price: 1_299.99)
  end

  def test_no_worker
    # no workers should add a 0% markup
  end

  def test_no_category
    # other categories is a 0% markup
  end

  def test_round_cents
    # a test to make round cents pass

    # a test to make round cents fail
  end

  def test_edge_cases
    # base price should be positive
    assert_raises ArgumentError do
      Product.final_cost(base_price: -21, workers: 3, category: 'food')
    end
    assert_raises ArgumentError do
      Product.final_cost(base_price: 0, workers: 3, category: 'food')
    end
    # number of workers in product should be positive
    assert_raises ArgumentError do
      Product.final_cost(base_price: 1_299.99, workers: -1, category: 'food')
    end
    assert_raises ArgumentError do
      Product.final_cost(base_price: 1_299.99, workers: 1.2, category: 'food')
    end
    # category should be a string
    assert_raises ArgumentError do
      Product.final_cost(base_price: 1_299.99, workers: 3, category: 1)
    end
  end
end

require_relative 'product'
require 'test/unit'

class TestMarkup < Test::Unit::TestCase
  def test_simple
    assert_equal 1_591.58, Product.final_cost(base_price: 1_299.99, workers: 3, category: 'food')
    assert_equal 6_199.81, Product.final_cost(base_price: 5_432.00, workers: 1, category: 'drugs')
    assert_equal 13_707.63, Product.final_cost(base_price: 12_456.95, workers: 4, category: 'books')
  end

  def test_no_worker
    # no workers should add a 0% markup
  end

  def tet_no_category
    # other categories is a 0% markup
  end

  def test_edge_cases
    # base price should be positive
    assert_raises ArgumentError do
      Product.final_cost(base_price: -21, workers: 3, category: 'food')
    end
    # number of workers in product should be positive
    assert_raises ArgumentError do
      Product.final_cost(base_price: 1, workers: -1, category: 'food')
    end
    # category should be a string
    assert_raises ArgumentError do
      Product.final_cost(base_price: 1, workers: 1, category: 1)
    end
  end
end

module Algebra
  class MonomialTest < TLDR
    def test_product_of_zero_and_one_equals_one
      assert_equal Monomial.new(1), Monomial.new(0) * Monomial.new(1)
    end

    def test_product_of_one_and_zero_equals_one
      assert_equal Monomial.new(1), Monomial.new(1) * Monomial.new(0)
    end

    def test_product_of_one_and_one_equals_two
      assert_equal Monomial.new(2), Monomial.new(1) * Monomial.new(1)
    end
  end
end

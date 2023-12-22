module Algebra
  class PolynomialTest < TLDR
    def e
      @e ||= Polynomial.new(Monomial.new(0))
    end

    def x
      @x ||= Polynomial.new(Monomial.new(1))
    end

    def test_hash_1_hash_1_are_equal
      assert_equal e.hash, e.hash
    end

    def test_hash_1_hash_x_are_not_equal
      refute_equal e.hash, x.hash
    end

    def test_1_1_are_equal
      assert_equal 1, 1
    end

    def test_1_x_are_not_equal
      refute_equal 1, x
    end

    def test_x_1_are_not_equal
      refute_equal x, 1
    end

    def test_x_x_are_equal
      assert_equal x, x
    end

    def test_product
      assert_equal (x**2) + x, x * (x + 1)
    end

    def test_power
      assert_equal (x**2) + (2 * x) + 1, (x + 1)**2
    end
  end
end

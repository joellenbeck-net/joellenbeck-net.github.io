module Algebra
  class PermutationTest < TLDR
    def test_id
      id = Permutation.new
      assert_equal 1, id[1]
      assert_equal 2, id[2]
      assert_equal 3, id[3]
    end

    def test_cycle
      cycle = Permutation.new(1 => 2, 2 => 3, 3 => 1)
      assert_equal 2, cycle[1]
      assert_equal 3, cycle[2]
      assert_equal 1, cycle[3]
    end

    def test_equal
      pi  = Permutation.new(1 => 2, 2 => 3, 3 => 1)
      rho = Permutation.new(1 => 2, 2 => 3, 3 => 1)
      assert_equal pi, rho
    end

    def test_not_equal
      pi = Permutation.new(1 => 2, 2 => 3, 3 => 1)
      id = Permutation.new
      refute_equal pi, id
    end

    def test_product
      id  = Permutation.new
      pi  = Permutation.new(1 => 2, 2 => 3, 3 => 1)
      rho = Permutation.new(1 => 3, 2 => 1, 3 => 2)
      assert_equal id, pi * rho
    end
  end
end

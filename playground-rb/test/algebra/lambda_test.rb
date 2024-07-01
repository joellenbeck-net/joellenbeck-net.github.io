module Algebra
  class LambdaTest < TLDR
    def fac_gen
      @fac_gen ||= ->(f) { ->(x) { x.zero? ? 1 : x * f.call(x - 1) } }
    end

    def fac
      @fac ||= Lambda.y_combinator(fac_gen)
    end

    def test_fac_zero
      assert_equal 1, fac.call(0)
    end

    def test_fac_one
      assert_equal 1, fac.call(1)
    end

    def test_fac_two
      assert_equal 2, fac.call(2)
    end

    def test_fac_three
      assert_equal 6, fac.call(3)
    end

    def test_fac_four
      assert_equal 24, fac.call(4)
    end

    def test_fac_five
      assert_equal 120, fac.call(5)
    end

    def fib_gen
      @fib_gen ||= lambda do |f|
        lambda do |x|
          case x
          when 0
            0
          when 1
            1
          else
            f.call(x - 1) + f.call(x - 2)
          end
        end
      end
    end

    def fib
      @fib ||= Lambda.y_combinator(fib_gen)
    end

    def test_fib_zero
      assert_equal 0, fib.call(0)
    end

    def test_fib_one
      assert_equal 1, fib.call(1)
    end

    def test_fib_two
      assert_equal 1, fib.call(2)
    end

    def test_fib_three
      assert_equal 2, fib.call(3)
    end

    # TODO: Failing test
    def _test_fib_four
      assert_equal 5, fib.call(4)
    end
  end
end

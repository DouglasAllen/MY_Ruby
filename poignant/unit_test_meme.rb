require 'minitest/autorun'
require './meme'
# optionally run benchmarks, good for CI-only work!
  require 'minitest/benchmark' if ENV["BENCH"]
  
  class TestMeme < MiniTest::Unit::TestCase
    def setup
      @meme = Meme.new
    end

    def test_that_kitty_can_eat
      assert_equal "OHAI!", @meme.i_can_has_cheezburger?
    end

    def test_that_it_will_not_blend
      refute_match /^no/i, @meme.will_it_blend?
    end
  end
  
  

    # Override self.bench_range or default range is [1, 10, 100, 1_000, 10_000]
    def bench_my_algorithm
      assert_performance_linear 0.9999 do |n| # n is a range value
        n.times do
          @obj.my_algorithm
        end
      end
    end
  


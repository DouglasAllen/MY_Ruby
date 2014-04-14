# file: testnet.rb
require 'test/unit'
require './net'

class TestNet < Test::Unit::TestCase
  def test_untied
    net = Net.new
    assert_equal true, net.untied?(1,1)
  end
end
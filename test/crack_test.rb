require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/crack'

class CrackTest < Minitest::Test
  def test_it_cracks_the_code
    output = "lw5jsqt9dw7b"
    date = Time.now
    cracked = Crack.new(output, date)
    assert_equal "hello ...end", cracked
  end
end

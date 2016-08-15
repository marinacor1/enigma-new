require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/offset'

class OffsetTest < Minitest::Test
  def test_it_returns_a_date_that_is_six_digits
    offset = Offset.new
    assert_equal Fixnum, offset.time.class
    assert_equal 6, offset.time.to_s.length
  end

end

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/encrypt'

class EncryptTest < Minitest::Test
  def test_it_converts_message_to_numbers
    encrypted = Encrypt.new("hello")
    assert_equal [0, 1, 2, 2, 4], encrypted.converted
  end

end

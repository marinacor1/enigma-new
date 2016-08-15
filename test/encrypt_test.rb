require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/encrypt'

class EncryptTest < Minitest::Test
  def test_it_converts_message_to_numbers
    encrypted = Encrypt.new("hello")
    assert_equal [7, 4, 11, 11, 14], encrypted.converted
  end

end

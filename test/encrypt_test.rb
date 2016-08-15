require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/encrypt'

class EncryptTest < Minitest::Test
  def test_it_converts_message_to_numbers
    encrypted = Encrypt.new("hello", "123456")
    assert_equal [7, 4, 11, 11, 14], encrypted.converted
  end

  def test_rotate_message_according_to_offsets
    encrypted = Encrypt.new("hello", 123456)
    assert_equal [8, 6, 14, 15, 19], encrypted.rotate_message([1, 2, 3, 4, 5])
  end

end

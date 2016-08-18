require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/encrypt'
require_relative '../lib/offset'

class EncryptTest < Minitest::Test
  def test_it_converts_message_to_numbers
    offsets= Offset.new
    encrypted = Encrypt.new("hello", "123456", offsets)
    assert_equal [7, 4, 11, 11, 14], encrypted.converted
  end

  def test_rotate_message_according_to_offsets
    offsets= Offset.new
    encrypted = Encrypt.new("hello", '123456', offsets)
    hash = {"a"=>9, "b"=>49, "c"=>22, "d"=>81}
    assert_equal [16, 15, 33, 16, 23], encrypted.rotate_message(hash)
  end

end

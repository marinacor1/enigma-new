require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/encrypt'
require_relative '../lib/offset'
require_relative '../lib/key_generator'

class EncryptTest < Minitest::Test
  def test_it_converts_message_to_numbers
    offsets= Offset.new
    key = KeyGenerator.new
    encrypted = Encrypt.new("hello ...end", key.key, offsets.last_four_digits)
    assert_equal [7, 4, 11, 11, 14, 36, 37, 37, 37, 4, 13, 3], encrypted.converted
  end

  def test_rotate_message_according_to_offsets
    offsets= Offset.new
    key = KeyGenerator.new
    encrypted = Encrypt.new("hello ...end", key.key, offsets.last_four_digits)
    hash = {"a"=>9, "b"=>49, "c"=>22, "d"=>81}
    assert_equal [16, 15, 33, 16, 23, 9, 21, 4, 8, 15, 35, 8], encrypted.rotate_message(hash)
  end

end

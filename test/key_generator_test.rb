require 'pry'
require_relative '../lib/key_generator.rb'
require 'minitest/autorun'
require 'minitest/pride'

class KeyGeneratorTest < MiniTest::Test
  def test_each_key_is_unique
    key1 = KeyGenerator.new
    key2 = KeyGenerator.new
    refute key1.key == key2.key
  end

  def test_each_key_is_five_digits
    keygenerator = KeyGenerator.new
    assert_equal 5, keygenerator.key.length
    # assert_equal Fixnum, keygenerator.key.class
  end

  def test_rotations_are_two_characters_in_length
    keygenerator = KeyGenerator.new
    assert_equal 2, keygenerator.a_rotation.length
    assert_equal 2, keygenerator.b_rotation.length
    assert_equal 2, keygenerator.c_rotation.length
    assert_equal 2, keygenerator.d_rotation.length
  end
end

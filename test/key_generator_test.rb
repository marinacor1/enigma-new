require 'pry'
require_relative '../lib/key_generator.rb'
require 'minitest/autorun'
require 'minitest/pride'

class KeyGeneratorTest < MiniTest::Test
  def test_each_key_is_unique
    key1 = KeyGenerator.new
    key2 = KeyGenerator.new
    key3 = KeyGenerator.new
    refute key1.key == key2.key
    refute key1.key == key3.key
    refute key3.key == key2.key
  end

  def test_each_key_is_five_digits
    keygenerator = KeyGenerator.new
    assert_equal 5, keygenerator.key.length
  end

end

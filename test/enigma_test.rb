require 'minitest/autorun'
require 'minitest/pride'
require_relative "../lib/offset"
require_relative '../lib/enigma'

class EnigmaTest < Minitest::Test
  def test_it_encrypts_correctly
    e = Enigma.new
    my_message = "this is so secret ..end.."
    output = e.encrypt(my_message)
    assert_equal "2s4xhtcd1zuxnnbj2jvenyzei", output
  end

  def test_decrypt_works_correctly
    e = Enigma.new
    output = "2s4xhtcd1zuxnnbj2jvenyzei"
    offsets = Offset.new
    decrypted = e.decrypt(output, "12345", offsets) #date is optional
    assert_equal "this is so secret ..end..", decrypted
  end

  def test_crack_works_correctly
    skip
    e = Enigma.new
    cracked = e.crack(output, Date.today) #date is optional
    assert_equal "this is so secret ..end..", cracked
  end
end

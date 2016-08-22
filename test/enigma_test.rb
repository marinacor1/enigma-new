require 'minitest/autorun'
require 'minitest/pride'
require_relative "../lib/offset"
require_relative '../lib/enigma'
require 'pry'

class EnigmaTest < Minitest::Test
  def test_it_encrypt_and_decrypt_works_correctly
    e = Enigma.new
    key = e.key.key
    my_message = "this is so secret ..end.."
    output = e.encrypt(my_message, key, e.offsets_info)
    decrypted = e.decrypt(output, key, e.offsets_info) #date is optional
    assert_equal "this is so secret ..end..", decrypted

  end

  # def test_decrypt_works_correctly
  #   e = Enigma.new
  #   output = "2s4xhtcd1zuxnnbj2jvenyzei"
  #   decrypted = e.decrypt(output, "12345", offsets) #date is optional
  #   assert_equal "this is so secret ..end..", decrypted
  # end

  def test_crack_works_correctly
    skip
    e = Enigma.new
    cracked = e.crack(output, Date.today) #date is optional
    assert_equal "this is so secret ..end..", cracked
  end
end

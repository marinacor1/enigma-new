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
    output = e.encrypt(my_message, key, e.offsets_info.last_four_digits)
    decrypted = e.decrypt(output, key, e.offsets_info.last_four_digits)
    assert_equal "this is so secret ..end..", decrypted
  end

  def test_encrypt_changes_the_message
    e = Enigma.new
    key = e.key.key
    my_message = "welcome to a secret"
    output = e.encrypt(my_message, key, e.offsets_info.last_four_digits)
    assert_equal my_message.length, output.length
    assert_equal String, output.class
  end

  def test_it_encrypt_and_decrypt_works_correctly_with_different_text
    e = Enigma.new
    key = e.key.key
    my_message = "marina is awesome1233"
    output = e.encrypt(my_message, key, e.offsets_info.last_four_digits)
    decrypted = e.decrypt(output, key, e.offsets_info.last_four_digits) #date is optional
    assert_equal "marina is awesome1233", decrypted
  end

  def test_crack_works_correctly
    skip
    e = Enigma.new
    cracked = e.crack(output, Date.today) #date is optional
    assert_equal "this is so secret ..end..", cracked
  end
end

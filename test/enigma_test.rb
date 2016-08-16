require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/enigma'

class EngimaTest < Minitest::Test
  def test_it_encrypts_correctly
    e = Engima.new
    my_message = "this is so scret ..end.."
    output = e.encrypt(my_message)
    assert_equal "lsdjfsdllsdfjls", output
  end

  def test_decrypt_works_correctly
    skip
    e = Enigma.new
    output = "ljsdfldjs"
    decrypted = e.decrypt(output, "12345", Date.today) #date is optional
    assert_equal "this is so secret ..end..", decrypted
  end

  def test_crack_works_correctly
    skip
    e = Engima.new
    cracked = e.crack(output, Date.today) #date is optional
    assert_equal "this is so secret ..end..", cracked
  end
end

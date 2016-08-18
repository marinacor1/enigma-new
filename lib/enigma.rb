require_relative 'key_generator'
require_relative 'offset'
require_relative 'encrypt'
require_relative 'decrypt'

class Enigma
  attr_accessor :key, :offsets

  def initialize
    @key = KeyGenerator.new
    @offsets = Offset.new
  end

  def encrypt(message)
    encryption = Encrypt.new(message, key, offsets)
    encryption.encrypted
  end

  def decrypt(output, offsets)
    decryption = Decrypt.new(output, key, offsets)
    decryption.decrypted
  end

  def crack(output)
    @cracked = Crack.new(output)
  end
end

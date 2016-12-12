require_relative 'key_generator'
require_relative 'offset'
require_relative 'encrypt'
require_relative 'decrypt'

class Enigma
  attr_accessor :key, :offsets_info

  def initialize
    @key = KeyGenerator.new
    @offsets_info = Offset.new
  end

  def encrypt(message, key, offsets)
    encryption = Encrypt.new(message, key, offsets)
    encryption.encrypted
  end

  def decrypt(output, key, offsets)
    decryption = Decrypt.new(output, key, offsets)
    decryption.decrypted
  end

  def crack(output)
    @cracked = Crack.new(output)
  end
end

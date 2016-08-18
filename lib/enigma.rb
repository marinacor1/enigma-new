require_relative 'key_generator'
require_relative 'offset'
require_relative 'encrypt'
require_relative 'decrypt'

class Enigma

  def initialize
    @key = KeyGenerator.new
    @offsets = Offset.new
  end

  def encrypt(message)
    encryption = Encrypt.new(message, @offsets.last_four_digits)
    encryption.encrypted
  end

  def decrypt(output, offsets)
    decryption = Decrypt.new(output, offsets)
    decryption.decrypted.join('')
  end

  def crack(output)
    @cracked = Crack.new(output)
  end
end

require_relative 'key_generator'
require_relative 'offset'
require_relative 'encrypt'
class Engima

  def initialize
    @key = KeyGenerator.new
    @offsets = Offset.new
  end

  def encrypt(message)
    encryption = Encrypt.new(message, @offsets.last_four_digits)
    encryption.encrypted
  end

  def decrypt(output)
    @decryption = Decrypt.new(output)
  end

  def crack(output)
    @cracked = Crack.new(output)
  end
end

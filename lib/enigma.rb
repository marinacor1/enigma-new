class Engima

  def initialize
    @key = KeyGenerator.new
    @offsets = Offset.new
  end

  def encrypt(message)
    @encryption = Encrypt.new(message, @offsets)
  end

  def decrypt(output)
    @decryption = Decrypt.new(output)
  end

  def crack(output)
    @cracked = Crack.new(output)
  end
end

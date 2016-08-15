class KeyGenerator
  attr_accessor :key

  def initialize
    @key = random_key
  end

  def random_key
    key = []
    key = [rand(0..9), rand(0..9), rand(0..9), rand(0..9), rand(0..9)]
    key.join
  end

end

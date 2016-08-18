class KeyGenerator
  attr_accessor :key, :a_rotation, :b_rotation, :c_rotation, :d_rotation

  def initialize
    @key = random_key
    @a_rotation = @key[0] + @key[1]
    @b_rotation = @key[1] + @key[2]
    @c_rotation = @key[2] + @key[3]
    @d_rotation = @key[3] + @key[4]
  end

  def random_key
    key = []
    key = [rand(0..9), rand(0..9), rand(0..9), rand(0..9), rand(0..9)]
    key.join
  end

end

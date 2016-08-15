class Engima

  def initialize
    @key = KeyGenerator.new
    @offset_calculator = Offset.new
  end
end

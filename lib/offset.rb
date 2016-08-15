class Offset
  attr_accessor :time

  def initialize
    @time = Time.now.strftime('%d%m%y').to_i
  end

end

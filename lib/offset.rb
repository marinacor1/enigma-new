class Offset
  attr_accessor :time, :last_four_digits

  def initialize
    @last_four_digits = create_offset
  end

  def create_offset
    time = Time.now.strftime('%d%m%y').to_i
    squared_date = (time * time).to_s
    [squared_date[-4], squared_date[-3], squared_date[-2], squared_date[-1]].join
  end

end

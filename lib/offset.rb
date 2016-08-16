class Offset
  attr_accessor :time, :a_offset, :b_offset, :c_offset, :d_offset, :last_four_digits

  def initialize
    @time = Time.now.strftime('%d%m%y').to_i
    last_four_digits = create_offset
    organize_offsets
    offsets_to_string
  end

  def create_offset
    squared_date = (@time * @time).to_s
    @last_four_digits = [squared_date[-4], squared_date[-3], squared_date[-2], squared_date[-1]].join
  end

  def organize_offsets
    @a_offset = last_four_digits[0]
    @b_offset = last_four_digits[1]
    @c_offset = last_four_digits[2]
    @d_offset = last_four_digits[3]
  end

  def offsets_to_string
    last_four_digits.to_s
  end



end

require_relative 'encrypt'
require_relative 'encryption_tools'
require_relative 'key_generator'

class Decrypt
  include EncryptionTools
  attr_accessor :decrypted

  def initialize(output, key, offsets)
    numbers = convert_to_numbers(output)
    @values = addOffsetsAndKey(offsets, KeyGenerator.new)
    # @values = {"a"=>9, "b"=>49, "c"=>22, "d"=>81}
    reset_numbers = revert_back(numbers)
    @decrypted = numbers_to_text(reset_numbers)
  end

  def convert_to_numbers(output)
    new = output.chars.map do |letter|
      character_map.index(letter)
    end
  end

  def revert_back(numbers)
    @reverted = []
    numbers.each_with_index do |num, index|
      if rotation_as.include?(index)
        new_num('a', num)
      elsif rotation_bs.include?(index)
        new_num('b', num)
      elsif rotation_cs.include?(index)
        new_num('c', num)
      else
        new_num('d', num)
      end
    end
    @reverted
  end

  def new_num(letter, num) #19
    new_num = num - @values[letter]
    if (new_num) < 0
      new_num = 38 + (new_num)
    end
    @reverted << (new_num)%38
  end

  def numbers_to_text(reset_numbers)
    reset = reset_numbers.map do |num|
      character_map[num]
    end
    reset.join
  end
end

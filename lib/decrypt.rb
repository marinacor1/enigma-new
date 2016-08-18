require_relative 'encrypt'
require_relative 'encryption_tools'
require 'pry'

class Decrypt
  include EncryptionTools
  attr_accessor :decrypted

  def initialize(output, key, offsets)
    numbers = convert_to_numbers(output)
    # values = addOffsetsAndKey(offsets, key)
    values = {"a"=>9, "b"=>49, "c"=>22, "d"=>81}
    reset_numbers = revert_back(numbers, values)
    @decrypted = numbers_to_text(reset_numbers)
  end

  def convert_to_numbers(output)
    new = output.chars.map do |letter|
      character_map.index(letter)
    end
  end

  def revert_back(numbers, values)
    reverted = []
    numbers.each do |num|
      if rotation_as.include?(num)
        reverted << (num - values['a'])%38
      elsif rotation_bs.include?(num)
        reverted << (num - values['b'])%38
      elsif rotation_cs.include?(num)
        reverted << num - (num - values['c'])%38
      else
        reverted << num - (num - values['d'])%38
      end
    end
    reverted
  end

  def numbers_to_text(reset_numbers)
    reset = reset_numbers.map do |num|
      character_map[num]
    end
    reset.join
  end
end

require_relative 'encrypt'
require_relative 'encryption_tools'
require 'pry'

class Decrypt
  include EncryptionTools
  attr_accessor :decrypted

  def initialize(output, offsets)
    numbers = convert_to_numbers(output)
    reset_numbers = revert_back(numbers, offsets)
    @decrypted = numbers_to_text(reset_numbers)
  end

  def convert_to_numbers(output)
    new = output.chars.map do |letter|
      character_map.index(letter)
    end
  end

  def revert_back(numbers, offsets)
    reverted = []
    numbers.each do |num|
      if rotation_as.include?(num)
        reverted << num - offsets[0].to_i
      elsif rotation_bs.include?(num)
        reverted << num - offsets[1].to_i
      elsif rotation_cs.include?(num)
        reverted << num - offsets[2].to_i
      else
        reverted << num - offsets[3].to_i
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

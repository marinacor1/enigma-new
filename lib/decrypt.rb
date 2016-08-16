require_relative 'encrypt'
require_relative 'encryption_tools'
require 'pry'

class Decrypt
  include CharacterMap
  attr_accessor :decrypted

  def initialize(output, offsets)
    numbers = convert_to_numbers(output)
    reset_numbers = revert_back(numbers, offsets)
    @decrypted = numbers_to_text(reset_numbers)
  end

  def convert_to_numbers(output)
    output.chars.map do |letter|
      character_map.index(letter)
    end
  end

  def revert_back(numbers, offsets)


  end
end

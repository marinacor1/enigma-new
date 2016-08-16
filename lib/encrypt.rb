require 'pry'
require_relative 'encryption_tools'
class Encrypt
  include EncryptionTools
  attr_accessor :converted, :encrypted

  def initialize(message, offsets)
    @converted = convert_message(message)
    offset_message = rotate_message(offsets)
    @encrypted = number_to_text(offset_message)
  end

  def convert_message(message)
    letters = message.chars
    converted_message = letters.map do |letter|
      character_map.index(letter)
    end
  end

  def rotate_message(offsets) #[7, 4, 11, 11, 14]
    offset_message = []
    @converted.each_with_index do |number, index|
      if rotation_as.include?(index)
        offset_message << (number + offsets[0].to_i)
      elsif rotation_bs.include?(index)
        offset_message << (number + offsets[1].to_i)
      elsif rotation_cs.include?(index)
        offset_message << (number + offsets[2].to_i)
      else
        offset_message << (number + offsets[3].to_i)
      end
    end
    offset_message
  end

  def number_to_text(offset_message)
    encrypted = offset_message.map do |number|
      if number < 39
        character_map[number]
      else
        character_map[number%39]
      end
    end
    encrypted.join
  end
end

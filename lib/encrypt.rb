require 'pry'
class Encrypt
  attr_accessor :converted

  def initialize(message, offsets)
    @converted = convert_message(message)
    rotate_message(offsets)
  end

  def convert_message(message)
    letters = message.chars
    converted_message = letters.map do |letter|
      character_map.index(letter)
    end
  end

  def character_map
    ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l',
    'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u',
    'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3',
    '4', '5', '6', '7', '8', '9', ' ', '.', ',']
  end

  def rotate_message(offsets) #[7, 4, 11, 11, 14]
    offset_message = []
    rotation_as = [0, 4, 8, 12, 16, 20, 24, 28, 32, 36, 40]
    rotation_bs = [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41]
    rotation_cs = [2, 6, 10, 14, 18, 22, 26, 30, 34, 38, 42]
    rotation_ds = [3, 7, 11, 15, 19, 23, 27, 31, 35, 39, 43]
    @converted.each_with_index do |number, index|
      if rotation_as.include?(index)
        offset_message << (number + offsets[0])
      elsif rotation_bs.include?(index)
        offset_message << (number + offsets[1])
      elsif rotation_cs.include?(index)
        offset_message << (number + offsets[2])
      else
        offset_message << (number + offsets[3])
      end
    end
  end
end

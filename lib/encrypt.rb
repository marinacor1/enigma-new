require_relative 'encryption_tools'
class Encrypt
  include EncryptionTools
  attr_accessor :converted, :encrypted

  def initialize(message, key, offsets)
    @converted = convert_message(message)
    values = addOffsetsAndKey(offsets, key)
    # values = {"a"=>9, "b"=>49, "c"=>22, "d"=>81}
    offset_message = rotate_message(values)
    @encrypted = number_to_text(offset_message)
  end

  def convert_message(message)
    letters = message.chars
    converted_message = letters.map do |letter|
      character_map.index(letter)
    end
  end

  def rotate_message(values) #{"a"=>9, "b"=>49, "c"=>22, "d"=>81}
    offset_message = []
    @converted.each_with_index do |number, index|
      if rotation_as.include?(index)
        offset_message << (number + values['a'])%38
      elsif rotation_bs.include?(index)
        offset_message << (number + values['b'])%38
      elsif rotation_cs.include?(index)
        offset_message << (number + values['c'])%38
      else
        offset_message << (number + values['d'])%38
      end
    end
    offset_message
  end

  def number_to_text(offset_message)
    encrypted = offset_message.map do |number|
        character_map[number%39]
    end
    encrypted.join
    binding.pry
  end
end

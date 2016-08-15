class Encrypt
  attr_accessor :converted

  def initialize(message)
    @converted = convert_message(message)
  end

  def convert_message(message)
    letters = message.chars
    converted_message = letters.map do |letter|
      letters.index(letter)
    end
  end

  def character_map
    ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
    'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3',
    '4', '5', '6', '7', '8', '9', ' ', '.', ',']
  end
end

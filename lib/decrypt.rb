require_relative 'encrypt'
require_relative 'character_map'
class Decrypt
  include CharacterMap
  attr_accessor :decrypted

  def initialize(output, offsets)

    numbers = convert_to_numbers(output)
    reset_numbers = revert_back(numbers, offsets)
    @decrypted = numbers_to_text(reset_numbers)
  end


end
